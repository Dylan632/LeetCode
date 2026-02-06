const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

// Configuration
// Assumes script is run from repo root or scripts dir
const REPO_ROOT = path.resolve(__dirname, '..');
const HOT100_FILE = path.join(__dirname, 'hot100.json');
const README_FILE = path.join(REPO_ROOT, 'README.md');

// 1. Load Hot 100 Data
console.log('Loading Hot 100 data...');
const hot100Data = JSON.parse(fs.readFileSync(HOT100_FILE, 'utf8'));

// 2. Scan Local Files
console.log('Scanning local files...');
const localFiles = {}; // id -> relPath

function scanDir(dir) {
  const items = fs.readdirSync(dir);
  for (const item of items) {
    if (item.startsWith('.') || item === 'node_modules' || item === 'scripts') continue;
    const fullPath = path.join(dir, item);
    const stat = fs.statSync(fullPath);
    
    if (stat.isDirectory()) {
      scanDir(fullPath);
    } else if (item.endsWith('.java')) {
      const match = item.match(/^(\d+)_/);
      if (match) {
        const fid = String(parseInt(match[1], 10));
        const relPath = path.relative(REPO_ROOT, fullPath).replace(/\\/g, '/');
        localFiles[fid] = relPath;
      }
    }
  }
}
scanDir(REPO_ROOT);

// Map to Hot 100 Data
const idToQuestion = {};
hot100Data.forEach(q => {
  idToQuestion[q.id] = q;
  if (localFiles[q.id]) {
    q.solved = true;
    q.filePath = localFiles[q.id];
  } else {
    q.solved = false;
  }
});

// 3. Analyze Git Log for Changelog
console.log('Analyzing git history...');
const changelog = new Map(); // Date -> Set<QuestionIDs>

try {
  const gitLog = execSync('git log --name-status --pretty=format:"COMMIT|%ad" --date=short', {
    cwd: REPO_ROOT,
    encoding: 'utf8'
  });
  
  const lines = gitLog.split(/\r?\n/);
  let currentDate = null;
  
  for (const line of lines) {
    if (line.startsWith('COMMIT|')) {
      currentDate = line.split('|')[1];
    } else if (currentDate && line.trim()) {
      // Format: A    Easy/0001_two-sum.java
      const parts = line.split(/\s+/);
      const status = parts[0];
      const filePath = parts[1];
      
      if ((status === 'A' || status === 'M') && filePath && filePath.endsWith('.java')) {
        const fileName = path.basename(filePath);
        const match = fileName.match(/^(\d+)_/);
        if (match) {
          const fid = String(parseInt(match[1], 10));
          // Only track if it's in Hot 100
          if (idToQuestion[fid]) {
            if (!changelog.has(currentDate)) {
              changelog.set(currentDate, new Set());
            }
            changelog.get(currentDate).add(fid);
          }
        }
      }
    }
  }
  
} catch (err) {
  console.error('Error reading git log:', err);
}

// 4. Generate README
console.log('Generating README...');
const solvedQuestions = hot100Data.filter(q => q.solved).length;
const totalQuestions = hot100Data.length;
const progressPercent = totalQuestions > 0 ? (solvedQuestions / totalQuestions) * 100 : 0;
const progressBarLength = 20;
const filledLength = Math.round(progressBarLength * solvedQuestions / totalQuestions);
const progressBar = '█'.repeat(filledLength) + '░'.repeat(progressBarLength - filledLength);

const md = [];
md.push(`# LeetCode Solutions (Hot 100)`);
md.push(``);
md.push(`我的 LeetCode 刷题记录，当前专注于 **LeetCode Hot 100**。`);
md.push(``);
md.push(`[![Progress](https://img.shields.io/badge/Progress-${solvedQuestions}%2F${totalQuestions}-blue)]()`);
md.push(`[![Language](https://img.shields.io/badge/Language-Java-orange)]()`);
md.push(``);
md.push(`## 📊 进度统计`);
md.push(``);
md.push(`**Total Progress**: ${solvedQuestions}/${totalQuestions} (${progressPercent.toFixed(1)}%)`);
md.push(`\`${progressBar}\``);
md.push(``);

// Topic List
md.push(`## 📝 题目列表 (按专题)`);
md.push(``);

const groups = new Map();
const groupOrder = [];
hot100Data.forEach(q => {
  if (!groups.has(q.group)) {
    groups.set(q.group, []);
    groupOrder.push(q.group);
  }
  groups.get(q.group).push(q);
});

for (const groupName of groupOrder) {
  const questions = groups.get(groupName);
  const solvedInGroup = questions.filter(q => q.solved).length;
  
  md.push(`### ${groupName} (${solvedInGroup}/${questions.length})`);
  md.push(``);
  md.push(`| # | 题目 | 难度 | 状态 | 解法 |`);
  md.push(`|---|------|------|------|------|`);
  
  for (const q of questions) {
    const statusIcon = q.solved ? "✅" : "⬜";
    const titleLink = `[${q.title}](https://leetcode.cn/problems/${q.slug}/)`;
    let diffIcon = q.difficulty === 'Easy' ? "🟢" : (q.difficulty === 'Medium' ? "🟡" : "🔴");
    const solutionLink = q.solved ? `[Java](${q.filePath})` : "-";
    
    md.push(`| ${q.id} | ${titleLink} | ${diffIcon} ${q.difficulty} | ${statusIcon} | ${solutionLink} |`);
  }
  md.push(``);
}

// Changelog
md.push(`## 📅 更新日志`);
md.push(``);

const dates = Array.from(changelog.keys()).sort().reverse(); 

for (const date of dates) {
  const fids = Array.from(changelog.get(date)).sort((a, b) => parseInt(a) - parseInt(b));
  if (fids.length === 0) continue;
  
  md.push(`- **${date}**: 新增 ${fids.length} 题`);
  
  for (const fid of fids) {
    const q = idToQuestion[fid];
    let diffIcon = q.difficulty === 'Easy' ? "🟢" : (q.difficulty === 'Medium' ? "🟡" : "🔴");
    const link = `[${q.title}](https://leetcode.cn/problems/${q.slug}/)`;
    md.push(`  - ${diffIcon} #${q.id} ${link} (${q.difficulty})`);
  }
  md.push(``);
}

// Todo List
md.push(`## 🚀 待办清单 (未完成)`);
md.push(``);
md.push(`| # | 题目 | 难度 | 专题 |`);
md.push(`|---|------|------|------|`);

let unsolvedCount = 0;
hot100Data.forEach(q => {
  if (!q.solved) {
    unsolvedCount++;
    let diffIcon = q.difficulty === 'Easy' ? "🟢" : (q.difficulty === 'Medium' ? "🟡" : "🔴");
    const titleLink = `[${q.title}](https://leetcode.cn/problems/${q.slug}/)`;
    md.push(`| ${q.id} | ${titleLink} | ${diffIcon} ${q.difficulty} | ${q.group} |`);
  }
});

if (unsolvedCount === 0) {
  md.push(`🎉 恭喜！你已经完成了所有 Hot 100 题目！`);
}

md.push(``);
md.push(`---`);
md.push(`Generated automatically by OpenCode.`);

fs.writeFileSync(README_FILE, md.join('\n'), 'utf8');
console.log('Done!');
