# LeetCode Hot 100 Metadata
$Hot100 = @(
    @{id=1; title="两数之和"; difficulty="Easy"; category="哈希"; url="https://leetcode.cn/problems/two-sum/"},
    @{id=49; title="字母异位词分组"; difficulty="Medium"; category="哈希"; url="https://leetcode.cn/problems/group-anagrams/"},
    @{id=128; title="最长连续序列"; difficulty="Medium"; category="哈希"; url="https://leetcode.cn/problems/longest-consecutive-sequence/"},
    @{id=283; title="移动零"; difficulty="Easy"; category="双指针"; url="https://leetcode.cn/problems/move-zeroes/"},
    @{id=11; title="盛最多水的容器"; difficulty="Medium"; category="双指针"; url="https://leetcode.cn/problems/container-with-most-water/"},
    @{id=15; title="三数之和"; difficulty="Medium"; category="双指针"; url="https://leetcode.cn/problems/3sum/"},
    @{id=42; title="接雨水"; difficulty="Hard"; category="双指针"; url="https://leetcode.cn/problems/trapping-rain-water/"},
    @{id=3; title="无重复字符的最长子串"; difficulty="Medium"; category="滑动窗口"; url="https://leetcode.cn/problems/longest-substring-without-repeating-characters/"},
    @{id=438; title="找到字符串中所有字母异位词"; difficulty="Medium"; category="滑动窗口"; url="https://leetcode.cn/problems/find-all-anagrams-in-a-string/"},
    @{id=560; title="和为 K 的子数组"; difficulty="Medium"; category="子串"; url="https://leetcode.cn/problems/subarray-sum-equals-k/"},
    @{id=239; title="滑动窗口最大值"; difficulty="Hard"; category="子串"; url="https://leetcode.cn/problems/sliding-window-maximum/"},
    @{id=76; title="最小覆盖子串"; difficulty="Hard"; category="子串"; url="https://leetcode.cn/problems/minimum-window-substring/"},
    @{id=53; title="最大子数组和"; difficulty="Medium"; category="普通数组"; url="https://leetcode.cn/problems/maximum-subarray/"},
    @{id=56; title="合并区间"; difficulty="Medium"; category="普通数组"; url="https://leetcode.cn/problems/merge-intervals/"},
    @{id=189; title="轮转数组"; difficulty="Medium"; category="普通数组"; url="https://leetcode.cn/problems/rotate-array/"},
    @{id=238; title="除了自身以外数组的乘积"; difficulty="Medium"; category="普通数组"; url="https://leetcode.cn/problems/product-of-array-except-self/"},
    @{id=41; title="缺失的第一个正数"; difficulty="Hard"; category="普通数组"; url="https://leetcode.cn/problems/first-missing-positive/"},
    @{id=73; title="矩阵置零"; difficulty="Medium"; category="矩阵"; url="https://leetcode.cn/problems/set-matrix-zeroes/"},
    @{id=54; title="螺旋矩阵"; difficulty="Medium"; category="矩阵"; url="https://leetcode.cn/problems/spiral-matrix/"},
    @{id=48; title="旋转图像"; difficulty="Medium"; category="矩阵"; url="https://leetcode.cn/problems/rotate-image/"},
    @{id=240; title="搜索二维矩阵 II"; difficulty="Medium"; category="矩阵"; url="https://leetcode.cn/problems/search-a-2d-matrix-ii/"},
    @{id=160; title="相交链表"; difficulty="Easy"; category="链表"; url="https://leetcode.cn/problems/intersection-of-two-linked-lists/"},
    @{id=206; title="反转链表"; difficulty="Easy"; category="链表"; url="https://leetcode.cn/problems/reverse-linked-list/"},
    @{id=234; title="回文链表"; difficulty="Easy"; category="链表"; url="https://leetcode.cn/problems/palindrome-linked-list/"},
    @{id=141; title="环形链表"; difficulty="Easy"; category="链表"; url="https://leetcode.cn/problems/linked-list-cycle/"},
    @{id=142; title="环形链表 II"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/linked-list-cycle-ii/"},
    @{id=21; title="合并两个有序链表"; difficulty="Easy"; category="链表"; url="https://leetcode.cn/problems/merge-two-sorted-lists/"},
    @{id=2; title="两数相加"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/add-two-numbers/"},
    @{id=19; title="删除链表的倒数第 N 个结点"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/remove-nth-node-from-end-of-list/"},
    @{id=24; title="两两交换链表中的节点"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/swap-nodes-in-pairs/"},
    @{id=25; title="K 个一组翻转链表"; difficulty="Hard"; category="链表"; url="https://leetcode.cn/problems/reverse-nodes-in-k-group/"},
    @{id=138; title="随机链表的复制"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/copy-list-with-random-pointer/"},
    @{id=148; title="排序链表"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/sort-list/"},
    @{id=23; title="合并 K 个升序链表"; difficulty="Hard"; category="链表"; url="https://leetcode.cn/problems/merge-k-sorted-lists/"},
    @{id=146; title="LRU 缓存"; difficulty="Medium"; category="链表"; url="https://leetcode.cn/problems/lru-cache/"},
    @{id=94; title="二叉树的中序遍历"; difficulty="Easy"; category="二叉树"; url="https://leetcode.cn/problems/binary-tree-inorder-traversal/"},
    @{id=104; title="二叉树的最大深度"; difficulty="Easy"; category="二叉树"; url="https://leetcode.cn/problems/maximum-depth-of-binary-tree/"},
    @{id=226; title="翻转二叉树"; difficulty="Easy"; category="二叉树"; url="https://leetcode.cn/problems/invert-binary-tree/"},
    @{id=101; title="对称二叉树"; difficulty="Easy"; category="二叉树"; url="https://leetcode.cn/problems/symmetric-tree/"},
    @{id=543; title="二叉树的直径"; difficulty="Easy"; category="二叉树"; url="https://leetcode.cn/problems/diameter-of-binary-tree/"},
    @{id=102; title="二叉树的层序遍历"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/binary-tree-level-order-traversal/"},
    @{id=108; title="将有序数组转换为二叉搜索树"; difficulty="Easy"; category="二叉树"; url="https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/"},
    @{id=98; title="验证二叉搜索树"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/validate-binary-search-tree/"},
    @{id=230; title="二叉搜索树中第 K 小的元素"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/kth-smallest-element-in-a-bst/"},
    @{id=199; title="二叉树的右视图"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/binary-tree-right-side-view/"},
    @{id=114; title="二叉树展开为链表"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/"},
    @{id=105; title="从前序与中序遍历序列构造二叉树"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/"},
    @{id=437; title="路径总和 III"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/path-sum-iii/"},
    @{id=236; title="二叉树的最近公共祖先"; difficulty="Medium"; category="二叉树"; url="https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/"},
    @{id=124; title="二叉树中的最大路径和"; difficulty="Hard"; category="二叉树"; url="https://leetcode.cn/problems/binary-tree-maximum-path-sum/"},
    @{id=200; title="岛屿数量"; difficulty="Medium"; category="图论"; url="https://leetcode.cn/problems/number-of-islands/"},
    @{id=994; title="腐烂的橘子"; difficulty="Medium"; category="图论"; url="https://leetcode.cn/problems/rotting-oranges/"},
    @{id=207; title="课程表"; difficulty="Medium"; category="图论"; url="https://leetcode.cn/problems/course-schedule/"},
    @{id=208; title="实现 Trie (前缀树)"; difficulty="Medium"; category="图论"; url="https://leetcode.cn/problems/implement-trie-prefix-tree/"},
    @{id=46; title="全排列"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/permutations/"},
    @{id=78; title="子集"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/subsets/"},
    @{id=17; title="电话号码的字母组合"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/letter-combinations-of-a-phone-number/"},
    @{id=39; title="组合总和"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/combination-sum/"},
    @{id=22; title="括号生成"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/generate-parentheses/"},
    @{id=79; title="单词搜索"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/word-search/"},
    @{id=131; title="分割回文串"; difficulty="Medium"; category="回溯"; url="https://leetcode.cn/problems/palindrome-partitioning/"},
    @{id=51; title="N 皇后"; difficulty="Hard"; category="回溯"; url="https://leetcode.cn/problems/n-queens/"},
    @{id=35; title="搜索插入位置"; difficulty="Easy"; category="二分查找"; url="https://leetcode.cn/problems/search-insert-position/"},
    @{id=74; title="搜索二维矩阵"; difficulty="Medium"; category="二分查找"; url="https://leetcode.cn/problems/search-a-2d-matrix/"},
    @{id=34; title="在排序数组中查找元素的第一个和最后一个位置"; difficulty="Medium"; category="二分查找"; url="https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/"},
    @{id=33; title="搜索旋转排序数组"; difficulty="Medium"; category="二分查找"; url="https://leetcode.cn/problems/search-in-rotated-sorted-array/"},
    @{id=153; title="寻找旋转排序数组中的最小值"; difficulty="Medium"; category="二分查找"; url="https://leetcode.cn/problems/find-minimum-in-rotated-sorted-array/"},
    @{id=4; title="寻找两个正序数组的中位数"; difficulty="Hard"; category="二分查找"; url="https://leetcode.cn/problems/median-of-two-sorted-arrays/"},
    @{id=20; title="有效的括号"; difficulty="Easy"; category="栈"; url="https://leetcode.cn/problems/valid-parentheses/"},
    @{id=155; title="最小栈"; difficulty="Medium"; category="栈"; url="https://leetcode.cn/problems/min-stack/"},
    @{id=394; title="字符串解码"; difficulty="Medium"; category="栈"; url="https://leetcode.cn/problems/decode-string/"},
    @{id=739; title="每日温度"; difficulty="Medium"; category="栈"; url="https://leetcode.cn/problems/daily-temperatures/"},
    @{id=84; title="柱状图中最大的矩形"; difficulty="Hard"; category="栈"; url="https://leetcode.cn/problems/largest-rectangle-in-histogram/"},
    @{id=215; title="数组中的第K个最大元素"; difficulty="Medium"; category="堆"; url="https://leetcode.cn/problems/kth-largest-element-in-an-array/"},
    @{id=347; title="前 K 个高频元素"; difficulty="Medium"; category="堆"; url="https://leetcode.cn/problems/top-k-frequent-elements/"},
    @{id=295; title="数据流的中位数"; difficulty="Hard"; category="堆"; url="https://leetcode.cn/problems/find-median-from-data-stream/"},
    @{id=121; title="买卖股票的最佳时机"; difficulty="Easy"; category="贪心算法"; url="https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/"},
    @{id=55; title="跳跃游戏"; difficulty="Medium"; category="贪心算法"; url="https://leetcode.cn/problems/jump-game/"},
    @{id=45; title="跳跃游戏 II"; difficulty="Medium"; category="贪心算法"; url="https://leetcode.cn/problems/jump-game-ii/"},
    @{id=763; title="划分字母区间"; difficulty="Medium"; category="贪心算法"; url="https://leetcode.cn/problems/partition-labels/"},
    @{id=70; title="爬楼梯"; difficulty="Easy"; category="动态规划"; url="https://leetcode.cn/problems/climbing-stairs/"},
    @{id=118; title="杨辉三角"; difficulty="Easy"; category="动态规划"; url="https://leetcode.cn/problems/pascals-triangle/"},
    @{id=198; title="打家劫舍"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/house-robber/"},
    @{id=279; title="完全平方数"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/perfect-squares/"},
    @{id=322; title="零钱兑换"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/coin-change/"},
    @{id=139; title="单词拆分"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/word-break/"},
    @{id=300; title="最长递增子序列"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/longest-increasing-subsequence/"},
    @{id=152; title="乘积最大子数组"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/maximum-product-subarray/"},
    @{id=416; title="分割等和子集"; difficulty="Medium"; category="动态规划"; url="https://leetcode.cn/problems/partition-equal-subset-sum/"},
    @{id=32; title="最长有效括号"; difficulty="Hard"; category="动态规划"; url="https://leetcode.cn/problems/longest-valid-parentheses/"},
    @{id=62; title="不同路径"; difficulty="Medium"; category="多维动态规划"; url="https://leetcode.cn/problems/unique-paths/"},
    @{id=64; title="最小路径和"; difficulty="Medium"; category="多维动态规划"; url="https://leetcode.cn/problems/minimum-path-sum/"},
    @{id=5; title="最长回文子串"; difficulty="Medium"; category="多维动态规划"; url="https://leetcode.cn/problems/longest-palindromic-substring/"},
    @{id=1143; title="最长公共子序列"; difficulty="Medium"; category="多维动态规划"; url="https://leetcode.cn/problems/longest-common-subsequence/"},
    @{id=72; title="编辑距离"; difficulty="Medium"; category="多维动态规划"; url="https://leetcode.cn/problems/edit-distance/"},
    @{id=136; title="只出现一次的数字"; difficulty="Easy"; category="技巧"; url="https://leetcode.cn/problems/single-number/"},
    @{id=169; title="多数元素"; difficulty="Easy"; category="技巧"; url="https://leetcode.cn/problems/majority-element/"},
    @{id=75; title="颜色分类"; difficulty="Medium"; category="技巧"; url="https://leetcode.cn/problems/sort-colors/"},
    @{id=31; title="下一个排列"; difficulty="Medium"; category="技巧"; url="https://leetcode.cn/problems/next-permutation/"},
    @{id=287; title="寻找重复数"; difficulty="Medium"; category="技巧"; url="https://leetcode.cn/problems/find-the-duplicate-number/"}
)

# 1. Scan for completed files
$workingDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$completedFiles = @{} # ID -> FileName

Get-ChildItem -Path $workingDir -Filter "*.md" | ForEach-Object {
    if ($_.Name -match "^(\d+)\.") {
        $id = [int]$matches[1]
        $completedFiles[$id] = $_.Name
    }
}

# 2. Calculate Progress
$total = $Hot100.Count
$done = 0
foreach ($item in $Hot100) {
    if ($completedFiles.ContainsKey($item.id)) {
        $done++
    }
}

if ($total -eq 0) { $percent = 0 } else { $percent = ($done / $total) * 100 }
$percentStr = "{0:N1}" -f $percent

# Generate Progress Bar (20 blocks)
$barWidth = 20
$filled = [Math]::Round(($done / $total) * $barWidth)
$empty = $barWidth - $filled
$bar = "█" * $filled + "░" * $empty

# 3. Generate README Content
$sb = New-Object System.Text.StringBuilder

$sb.AppendLine("# LeetCode Solutions (Hot 100)")
$sb.AppendLine("")
$sb.AppendLine("我的 LeetCode 刷题记录，当前专注于 **LeetCode Hot 100**。")
$sb.AppendLine("")
$sb.AppendLine("[![Progress](https://img.shields.io/badge/Progress-$done%2F$total-blue)]()")
$sb.AppendLine("[![Language](https://img.shields.io/badge/Language-Java-orange)]()")
$sb.AppendLine("")
$sb.AppendLine("## 📊 进度统计")
$sb.AppendLine("")
$sb.AppendLine("**Total Progress**: $done/$total ($percentStr%)")
$sb.AppendLine("`$bar`")
$sb.AppendLine("")
$sb.AppendLine("## 📝 题目列表 (按专题)")
$sb.AppendLine("")

# Group by Category
$categories = $Hot100 | Group-Object category

# Define category order (optional, to keep consistent)
$categoryOrder = @("哈希", "双指针", "滑动窗口", "子串", "普通数组", "矩阵", "链表", "二叉树", "图论", "回溯", "二分查找", "栈", "堆", "贪心算法", "动态规划", "多维动态规划", "技巧")

foreach ($catName in $categoryOrder) {
    $group = $categories | Where-Object { $_.Name -eq $catName }
    if ($group) {
        $catTotal = $group.Count
        $catDone = ($group.Group | Where-Object { $completedFiles.ContainsKey($_.id) }).Count
        
        $sb.AppendLine("### $catName ($catDone/$catTotal)")
        $sb.AppendLine("")
        $sb.AppendLine("| # | 题目 | 难度 | 状态 | 笔记 |")
        $sb.AppendLine("|---|------|------|------|------|")
        
        foreach ($item in $group.Group) {
            $id = $item.id
            $title = $item.title
            $url = $item.url
            $diff = $item.difficulty
            
            # Icons
            if ($diff -eq "Easy") { $diffIcon = "🟢 Easy" }
            elseif ($diff -eq "Medium") { $diffIcon = "🟡 Medium" }
            else { $diffIcon = "🔴 Hard" }
            
            if ($completedFiles.ContainsKey($id)) {
                $status = "✅"
                # Encode spaces for markdown link if needed, but standard usually works
                $noteName = $completedFiles[$id]
                # Note: GitHub handles spaces in relative links fine usually, but %20 is safer
                $noteLink = "[$title]($noteName)"
                $noteCell = "[查看笔记]($noteName)"
            } else {
                $status = "⬜"
                $noteLink = "[$title]($url)"
                $noteCell = "-"
            }
            
            $sb.AppendLine("| $id | $noteLink | $diffIcon | $status | $noteCell |")
        }
        $sb.AppendLine("")
    }
}

$sb.AppendLine("---")
$sb.AppendLine("Generated automatically by OpenCode Sync.")

# 4. Write to README.md
$readmePath = Join-Path $workingDir "README.md"
[IO.File]::WriteAllText($readmePath, $sb.ToString(), [System.Text.Encoding]::UTF8)

Write-Host "README.md has been updated. Progress: $done/$total"
