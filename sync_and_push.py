#!/usr/bin/env python3
"""
LeetCode 进度同步 & 自动上传脚本
用法: python sync_and_push.py
功能:
  1. 扫描当前目录下所有 <编号>.xxx.md 文件，提取已完成的题号
  2. 根据已完成题号自动更新 README.md 中的状态（⬜ → ✅）和进度统计
  3. 自动 git add → commit → push
"""

import os
import re
import subprocess
import sys
import math

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
README_PATH = os.path.join(SCRIPT_DIR, "README.md")


def get_completed_problem_numbers():
    """扫描目录下所有 <数字>.xxx.md 文件，返回已完成的题号集合"""
    completed = set()
    pattern = re.compile(r"^(\d+)\..+\.md$")
    for fname in os.listdir(SCRIPT_DIR):
        m = pattern.match(fname)
        if m:
            completed.add(int(m.group(1)))
    return completed


def make_progress_bar(done, total, length=20):
    """生成文本进度条，如 █████░░░░░░░░░░░░░░░"""
    filled = round(length * done / total) if total > 0 else 0
    return "█" * filled + "░" * (length - filled)


def update_readme(completed: set):
    """读取 README.md，根据 completed 集合更新状态标记和进度统计"""
    with open(README_PATH, "r", encoding="utf-8") as f:
        lines = f.readlines()

    # ---- 第一轮：更新每行的状态标记 ----
    # 匹配表格行，如: | 49 | [字母异位词分组](./49.字母异位词分组.md) | 🟡 Medium | ⬜ |
    row_pattern = re.compile(
        r"^(\|\s*)(\d+)(\s*\|.+\|.+\|\s*)(✅|⬜)(\s*\|)\s*$"
    )
    for i, line in enumerate(lines):
        m = row_pattern.match(line)
        if m:
            num = int(m.group(2))
            old_status = m.group(4)
            new_status = "✅" if num in completed else "⬜"
            if old_status != new_status:
                lines[i] = f"{m.group(1)}{m.group(2)}{m.group(3)}{new_status}{m.group(5)}\n"

    # ---- 第二轮：更新每个专题的 (done/total) 计数 ----
    # 匹配专题标题行，如: ### 哈希 (1/3)
    section_header = re.compile(r"^(### .+?\()(\d+)/(\d+)(\))\s*$")
    # 重新扫描更新后的 lines，统计每个 section 的完成数
    i = 0
    total_done = 0
    total_all = 0
    while i < len(lines):
        hm = section_header.match(lines[i])
        if hm:
            section_total = int(hm.group(3))
            section_done = 0
            # 往下扫描该 section 的表格行
            j = i + 1
            while j < len(lines):
                if lines[j].startswith("### ") or (lines[j].startswith("#") and not lines[j].startswith("###")):
                    break
                rm = row_pattern.match(lines[j])
                if rm:
                    if rm.group(4) == "✅":
                        section_done += 1
                j += 1
            # 更新 section 标题
            lines[i] = f"{hm.group(1)}{section_done}/{section_total}{hm.group(4)}\n"
            total_done += section_done
            total_all += section_total
            i = j
        else:
            i += 1

    # ---- 第三轮：更新顶部总进度 ----
    badge_pattern = re.compile(
        r"(\[!\[Progress\]\(https://img\.shields\.io/badge/Progress-)"
        r"(\d+%2F\d+)"
        r"(-blue\)\]\(\))"
    )
    total_line_pattern = re.compile(
        r"^(\*\*Total Progress\*\*:\s*)(\d+/\d+\s*\(\d+%\))\s*$"
    )
    bar_pattern = re.compile(r"^`[█░]+`\s*$")

    pct = round(100 * total_done / total_all) if total_all > 0 else 0
    for i, line in enumerate(lines):
        # 更新 badge
        bm = badge_pattern.search(line)
        if bm:
            lines[i] = line[:bm.start(2)] + f"{total_done}%2F{total_all}" + line[bm.end(2):]
        # 更新 Total Progress 文字
        tm = total_line_pattern.match(line)
        if tm:
            lines[i] = f"**Total Progress**: {total_done}/{total_all} ({pct}%)\n"
        # 更新进度条
        if bar_pattern.match(line):
            lines[i] = f"`{make_progress_bar(total_done, total_all)}`\n"

    with open(README_PATH, "w", encoding="utf-8") as f:
        f.writelines(lines)

    return total_done, total_all


def git_sync():
    """执行 git add, commit, push"""
    os.chdir(SCRIPT_DIR)

    # Stage all changes
    subprocess.run(["git", "add", "-A"], check=True)

    # Check if there are staged changes
    result = subprocess.run(
        ["git", "diff", "--cached", "--quiet"],
        capture_output=True
    )
    if result.returncode == 0:
        print("没有需要提交的更改。")
        return False

    # Commit
    subprocess.run(
        ["git", "commit", "-m", "sync: 更新刷题进度"],
        check=True
    )

    # Push
    subprocess.run(["git", "push"], check=True)
    return True


def main():
    print("=== LeetCode 进度同步脚本 ===\n")

    # 1. 扫描已完成题目
    completed = get_completed_problem_numbers()
    print(f"检测到 {len(completed)} 个题目笔记文件")

    # 2. 更新 README
    done, total = update_readme(completed)
    print(f"README 已更新: {done}/{total} ({round(100*done/total)}%)\n")

    # 3. Git 提交并推送
    print("正在提交并推送到 GitHub...")
    if git_sync():
        print("\n✅ 同步完成！已推送到 GitHub。")
    else:
        print("\n没有新的更改需要推送。")


if __name__ == "__main__":
    main()
