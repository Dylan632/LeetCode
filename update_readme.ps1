# 获取脚本所在的目录
$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

# --- 在这里修改每个难度的总题数 ---
$TotalEasy = 350
$TotalMedium = 650
$TotalHard = 250
# ---------------------------------

# 初始化计数器
$CompletedEasy = 0
$CompletedMedium = 0
$CompletedHard = 0

# 获取目录下的所有 .md 文件
$allMarkdownFiles = Get-ChildItem -Path $PSScriptRoot -Filter "*.md" -File

# 遍历文件并根据文件头部的元数据进行统计
foreach ($file in $allMarkdownFiles) {
    # 跳过 README 和主控平台文件
    if ($file.Name -in @("README.md", "算法学习主控平台.md")) {
        continue
    }

    # 读取文件的前10行，通常元数据都在这里
    $fileContent = Get-Content -Path $file.FullName -TotalCount 10
    
    # 简单的正则表达式，用于从 "difficulty: Easy" 这样的行中提取 "Easy"
    $difficultyMatch = $fileContent | Select-String -Pattern "(?i)^\s*difficulty:\s*(Easy|Medium|Hard)"
    
    if ($difficultyMatch) {
        $difficulty = $difficultyMatch.Matches[0].Groups[1].Value.Trim()
        
        if ($difficulty -eq "Easy") {
            $CompletedEasy++
        }
        elseif ($difficulty -eq "Medium") {
            $CompletedMedium++
        }
        elseif ($difficulty -eq "Hard") {
            $CompletedHard++
        }
    }
}

# 计算总进度
$TotalCompleted = $CompletedEasy + $CompletedMedium + $CompletedHard
$TotalProblems = $TotalEasy + $TotalMedium + $TotalHard
$ProgressPercentage = if ($TotalProblems -gt 0) { [Math]::Round(($TotalCompleted / $TotalProblems * 100), 2) } else { 0 }

# 创建 README 的内容
$ReadmeContent = @"
# LeetCode刷题笔记

欢迎来到我的 LeetCode 笔记仓库！

这里记录了我的刷题历程和解题思路，希望能不断进步。

---

## 进度总览

**总进度：$TotalCompleted / $TotalProblems 道 ($($ProgressPercentage)%)**

| 难度   | 已完成 | 总题数 | 进度条 |
| :----- | :---: | :---: | :--- |
| **Easy**   | $CompletedEasy   | $TotalEasy   | $( '🟩' * ([int]($CompletedEasy / $TotalEasy * 20)) )$( '⬜️' * (20 - [int]($CompletedEasy / $TotalEasy * 20)) ) |
| **Medium** | $CompletedMedium | $TotalMedium | $( '🟩' * ([int]($CompletedMedium / $TotalMedium * 20)) )$( '⬜️' * (20 - [int]($CompletedMedium / $TotalMedium * 20)) ) |
| **Hard**   | $CompletedHard   | $TotalHard   | $( '🟩' * ([int]($CompletedHard / $TotalHard * 20)) )$( '⬜️' * (20 - [int]($CompletedHard / $TotalHard * 20)) ) |

---

*该 README 由脚本自动生成于 $(Get-Date)*
"@

# 将内容写入 README.md 文件
Set-Content -Path (Join-Path $PSScriptRoot "README.md") -Value $ReadmeContent -Encoding UTF8

Write-Host "README.md has been updated successfully based on file content (frontmatter)."
