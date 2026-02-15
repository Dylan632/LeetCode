# 算法刷题

存放 LeetCode 算法题笔记，使用「算法模板」创建。

## 分类整理

```dataviewjs
const ROOT = "个人/Code/Java学习/50_Algorithm";

// Hot100 meta (used to auto-match difficulty/category by leetcode id)
// Source: https://raw.githubusercontent.com/Dylan632/LeetCode/main/README.md
const HOT100_META = new Map([
  [1, {"difficulty": "🟢 Easy", "category": "哈希"}],
  [2, {"difficulty": "🟡 Medium", "category": "链表"}],
  [3, {"difficulty": "🟡 Medium", "category": "滑动窗口"}],
  [4, {"difficulty": "🔴 Hard", "category": "二分查找"}],
  [5, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [11, {"difficulty": "🟡 Medium", "category": "双指针"}],
  [15, {"difficulty": "🟡 Medium", "category": "双指针"}],
  [17, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [19, {"difficulty": "🟡 Medium", "category": "链表"}],
  [20, {"difficulty": "🟢 Easy", "category": "栈"}],
  [21, {"difficulty": "🟢 Easy", "category": "链表"}],
  [22, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [23, {"difficulty": "🔴 Hard", "category": "链表"}],
  [24, {"difficulty": "🟡 Medium", "category": "链表"}],
  [25, {"difficulty": "🔴 Hard", "category": "链表"}],
  [31, {"difficulty": "🟡 Medium", "category": "技巧"}],
  [32, {"difficulty": "🔴 Hard", "category": "动态规划"}],
  [33, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [34, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [35, {"difficulty": "🟢 Easy", "category": "二分查找"}],
  [39, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [41, {"difficulty": "🔴 Hard", "category": "普通数组"}],
  [42, {"difficulty": "🔴 Hard", "category": "双指针"}],
  [45, {"difficulty": "🟡 Medium", "category": "贪心算法"}],
  [46, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [48, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [49, {"difficulty": "🟡 Medium", "category": "哈希"}],
  [51, {"difficulty": "🔴 Hard", "category": "回溯"}],
  [53, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [54, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [55, {"difficulty": "🟡 Medium", "category": "贪心算法"}],
  [56, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [62, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [64, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [70, {"difficulty": "🟢 Easy", "category": "动态规划"}],
  [72, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [73, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [74, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [75, {"difficulty": "🟡 Medium", "category": "技巧"}],
  [76, {"difficulty": "🔴 Hard", "category": "子串"}],
  [78, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [79, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [84, {"difficulty": "🔴 Hard", "category": "栈"}],
  [94, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [98, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [101, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [102, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [104, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [105, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [108, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [114, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [118, {"difficulty": "🟢 Easy", "category": "动态规划"}],
  [121, {"difficulty": "🟢 Easy", "category": "贪心算法"}],
  [124, {"difficulty": "🔴 Hard", "category": "二叉树"}],
  [128, {"difficulty": "🟡 Medium", "category": "哈希"}],
  [131, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [136, {"difficulty": "🟢 Easy", "category": "技巧"}],
  [138, {"difficulty": "🟡 Medium", "category": "链表"}],
  [139, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [141, {"difficulty": "🟢 Easy", "category": "链表"}],
  [142, {"difficulty": "🟡 Medium", "category": "链表"}],
  [146, {"difficulty": "🟡 Medium", "category": "链表"}],
  [148, {"difficulty": "🟡 Medium", "category": "链表"}],
  [152, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [153, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [155, {"difficulty": "🟡 Medium", "category": "栈"}],
  [160, {"difficulty": "🟢 Easy", "category": "链表"}],
  [169, {"difficulty": "🟢 Easy", "category": "技巧"}],
  [189, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [198, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [199, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [200, {"difficulty": "🟡 Medium", "category": "图论"}],
  [206, {"difficulty": "🟢 Easy", "category": "链表"}],
  [207, {"difficulty": "🟡 Medium", "category": "图论"}],
  [208, {"difficulty": "🟡 Medium", "category": "图论"}],
  [215, {"difficulty": "🟡 Medium", "category": "堆"}],
  [226, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [230, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [234, {"difficulty": "🟢 Easy", "category": "链表"}],
  [236, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [238, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [239, {"difficulty": "🔴 Hard", "category": "子串"}],
  [240, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [279, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [283, {"difficulty": "🟢 Easy", "category": "双指针"}],
  [287, {"difficulty": "🟡 Medium", "category": "技巧"}],
  [295, {"difficulty": "🔴 Hard", "category": "堆"}],
  [300, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [322, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [347, {"difficulty": "🟡 Medium", "category": "堆"}],
  [394, {"difficulty": "🟡 Medium", "category": "栈"}],
  [416, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [437, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [438, {"difficulty": "🟡 Medium", "category": "滑动窗口"}],
  [543, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [560, {"difficulty": "🟡 Medium", "category": "子串"}],
  [739, {"difficulty": "🟡 Medium", "category": "栈"}],
  [763, {"difficulty": "🟡 Medium", "category": "贪心算法"}],
  [994, {"difficulty": "🟡 Medium", "category": "图论"}],
  [1143, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
]);

function extractLeetCodeIdFromPage(p) {
  const fm = p.leetcode;
  const fromFrontmatter = Number(fm);
  if (Number.isFinite(fromFrontmatter) && fromFrontmatter > 0) return fromFrontmatter;

  const m = String(p.file?.name ?? "").match(/^(\d+)/);
  if (m) {
    const fromName = Number(m[1]);
    if (Number.isFinite(fromName) && fromName > 0) return fromName;
  }

  return null;
}

function renderCategory(p, leetcodeId) {
  const meta = leetcodeId == null ? null : HOT100_META.get(leetcodeId);
  return meta?.category ?? (p.category ?? "");
}

function sortByLeetCodeId(a, b) {
  const aid = extractLeetCodeIdFromPage(a);
  const bid = extractLeetCodeIdFromPage(b);
  const ax = aid == null ? 1e9 : aid;
  const bx = bid == null ? 1e9 : bid;
  if (ax !== bx) return ax - bx;
  return String(a.file.name).localeCompare(String(b.file.name), undefined, { numeric: true });
}

const pages = dv.pages(`"${ROOT}"`).where((p) => p.type === "algorithm").array();
const groups = new Map();

for (const p of pages) {
  const id = extractLeetCodeIdFromPage(p);
  const key = renderCategory(p, id) || "(未分类)";
  const arr = groups.get(key) ?? [];
  arr.push(p);
  groups.set(key, arr);
}

const rows = Array.from(groups.entries())
  .sort(([a], [b]) => String(a).localeCompare(String(b), "zh-CN"))
  .map(([key, ps]) => {
    const sorted = ps.sort(sortByLeetCodeId);
    const reps = sorted.map((p) => p.file.link);
    const hot100Marks = sorted.map((p) => {
      const id = extractLeetCodeIdFromPage(p);
      const isHot100 = id != null && HOT100_META.has(id);
      return isHot100 ? "" : "❌";
    });
    return [key, reps, hot100Marks];
  });

dv.table(["类型", "代表题目", "是否是hot100"], rows);
```

## 快速筛选

```dataviewjs
const ROOT = "个人/Code/Java学习/50_Algorithm";

// Hot100 meta (used to auto-match difficulty/category by leetcode id)
// Source: https://raw.githubusercontent.com/Dylan632/LeetCode/main/README.md
const HOT100_META = new Map([
  [1, {"difficulty": "🟢 Easy", "category": "哈希"}],
  [2, {"difficulty": "🟡 Medium", "category": "链表"}],
  [3, {"difficulty": "🟡 Medium", "category": "滑动窗口"}],
  [4, {"difficulty": "🔴 Hard", "category": "二分查找"}],
  [5, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [11, {"difficulty": "🟡 Medium", "category": "双指针"}],
  [15, {"difficulty": "🟡 Medium", "category": "双指针"}],
  [17, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [19, {"difficulty": "🟡 Medium", "category": "链表"}],
  [20, {"difficulty": "🟢 Easy", "category": "栈"}],
  [21, {"difficulty": "🟢 Easy", "category": "链表"}],
  [22, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [23, {"difficulty": "🔴 Hard", "category": "链表"}],
  [24, {"difficulty": "🟡 Medium", "category": "链表"}],
  [25, {"difficulty": "🔴 Hard", "category": "链表"}],
  [31, {"difficulty": "🟡 Medium", "category": "技巧"}],
  [32, {"difficulty": "🔴 Hard", "category": "动态规划"}],
  [33, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [34, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [35, {"difficulty": "🟢 Easy", "category": "二分查找"}],
  [39, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [41, {"difficulty": "🔴 Hard", "category": "普通数组"}],
  [42, {"difficulty": "🔴 Hard", "category": "双指针"}],
  [45, {"difficulty": "🟡 Medium", "category": "贪心算法"}],
  [46, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [48, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [49, {"difficulty": "🟡 Medium", "category": "哈希"}],
  [51, {"difficulty": "🔴 Hard", "category": "回溯"}],
  [53, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [54, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [55, {"difficulty": "🟡 Medium", "category": "贪心算法"}],
  [56, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [62, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [64, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [70, {"difficulty": "🟢 Easy", "category": "动态规划"}],
  [72, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
  [73, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [74, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [75, {"difficulty": "🟡 Medium", "category": "技巧"}],
  [76, {"difficulty": "🔴 Hard", "category": "子串"}],
  [78, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [79, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [84, {"difficulty": "🔴 Hard", "category": "栈"}],
  [94, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [98, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [101, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [102, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [104, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [105, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [108, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [114, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [118, {"difficulty": "🟢 Easy", "category": "动态规划"}],
  [121, {"difficulty": "🟢 Easy", "category": "贪心算法"}],
  [124, {"difficulty": "🔴 Hard", "category": "二叉树"}],
  [128, {"difficulty": "🟡 Medium", "category": "哈希"}],
  [131, {"difficulty": "🟡 Medium", "category": "回溯"}],
  [136, {"difficulty": "🟢 Easy", "category": "技巧"}],
  [138, {"difficulty": "🟡 Medium", "category": "链表"}],
  [139, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [141, {"difficulty": "🟢 Easy", "category": "链表"}],
  [142, {"difficulty": "🟡 Medium", "category": "链表"}],
  [146, {"difficulty": "🟡 Medium", "category": "链表"}],
  [148, {"difficulty": "🟡 Medium", "category": "链表"}],
  [152, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [153, {"difficulty": "🟡 Medium", "category": "二分查找"}],
  [155, {"difficulty": "🟡 Medium", "category": "栈"}],
  [160, {"difficulty": "🟢 Easy", "category": "链表"}],
  [169, {"difficulty": "🟢 Easy", "category": "技巧"}],
  [189, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [198, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [199, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [200, {"difficulty": "🟡 Medium", "category": "图论"}],
  [206, {"difficulty": "🟢 Easy", "category": "链表"}],
  [207, {"difficulty": "🟡 Medium", "category": "图论"}],
  [208, {"difficulty": "🟡 Medium", "category": "图论"}],
  [215, {"difficulty": "🟡 Medium", "category": "堆"}],
  [226, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [230, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [234, {"difficulty": "🟢 Easy", "category": "链表"}],
  [236, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [238, {"difficulty": "🟡 Medium", "category": "普通数组"}],
  [239, {"difficulty": "🔴 Hard", "category": "子串"}],
  [240, {"difficulty": "🟡 Medium", "category": "矩阵"}],
  [279, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [283, {"difficulty": "🟢 Easy", "category": "双指针"}],
  [287, {"difficulty": "🟡 Medium", "category": "技巧"}],
  [295, {"difficulty": "🔴 Hard", "category": "堆"}],
  [300, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [322, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [347, {"difficulty": "🟡 Medium", "category": "堆"}],
  [394, {"difficulty": "🟡 Medium", "category": "栈"}],
  [416, {"difficulty": "🟡 Medium", "category": "动态规划"}],
  [437, {"difficulty": "🟡 Medium", "category": "二叉树"}],
  [438, {"difficulty": "🟡 Medium", "category": "滑动窗口"}],
  [543, {"difficulty": "🟢 Easy", "category": "二叉树"}],
  [560, {"difficulty": "🟡 Medium", "category": "子串"}],
  [739, {"difficulty": "🟡 Medium", "category": "栈"}],
  [763, {"difficulty": "🟡 Medium", "category": "贪心算法"}],
  [994, {"difficulty": "🟡 Medium", "category": "图论"}],
  [1143, {"difficulty": "🟡 Medium", "category": "多维动态规划"}],
]);

function extractLeetCodeIdFromPage(p) {
  const fm = p.leetcode;
  const fromFrontmatter = Number(fm);
  if (Number.isFinite(fromFrontmatter) && fromFrontmatter > 0) return fromFrontmatter;

  const m = String(p.file?.name ?? "").match(/^(\d+)/);
  if (m) {
    const fromName = Number(m[1]);
    if (Number.isFinite(fromName) && fromName > 0) return fromName;
  }

  return null;
}

function toArray(v) {
  if (!v) return [];
  if (Array.isArray(v)) return v;
  if (typeof v === "object" && typeof v.array === "function") return v.array();
  return [v];
}

function renderDifficulty(p, leetcodeId) {
  const meta = leetcodeId == null ? null : HOT100_META.get(leetcodeId);
  return meta?.difficulty ?? (p.difficulty ?? "");
}

function renderCategory(p, leetcodeId) {
  const meta = leetcodeId == null ? null : HOT100_META.get(leetcodeId);
  return meta?.category ?? (p.category ?? "");
}

function renderTags(p) {
  const tags = toArray(p.tags).map((t) => String(t ?? "").trim()).filter(Boolean);
  return tags.join(", ");
}

const pages = dv.pages(`"${ROOT}"`).where((p) => p.type === "algorithm").array();
pages.sort((a, b) =>
  String(a.file.name).localeCompare(String(b.file.name), undefined, {
    numeric: true,
    sensitivity: "base",
  })
);

const rows = pages.map((p) => {
  const id = extractLeetCodeIdFromPage(p);
  return [p.file.link, renderDifficulty(p, id), renderCategory(p, id), renderTags(p)];
});

dv.table(["题目", "difficulty", "category", "tags"], rows);
```

## 进度管理

```dataviewjs
// GitHub README-style Hot100 board (copied layout)
// Source README: https://github.com/Dylan632/LeetCode/blob/main/README.md
const ROOT = "个人/Code/Java学习/50_Algorithm";

const TOPICS = [
  {
    "topic": "哈希",
    "problems": [
      { "id": 1, "title": "两数之和", "url": "https://leetcode.cn/problems/two-sum/", "difficulty": "🟢 Easy" },
      { "id": 49, "title": "字母异位词分组", "url": "https://leetcode.cn/problems/group-anagrams/", "difficulty": "🟡 Medium" },
      { "id": 128, "title": "最长连续序列", "url": "https://leetcode.cn/problems/longest-consecutive-sequence/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "双指针",
    "problems": [
      { "id": 283, "title": "移动零", "url": "https://leetcode.cn/problems/move-zeroes/", "difficulty": "🟢 Easy" },
      { "id": 11, "title": "盛最多水的容器", "url": "https://leetcode.cn/problems/container-with-most-water/", "difficulty": "🟡 Medium" },
      { "id": 15, "title": "三数之和", "url": "https://leetcode.cn/problems/3sum/", "difficulty": "🟡 Medium" },
      { "id": 42, "title": "接雨水", "url": "https://leetcode.cn/problems/trapping-rain-water/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "滑动窗口",
    "problems": [
      { "id": 3, "title": "无重复字符的最长子串", "url": "https://leetcode.cn/problems/longest-substring-without-repeating-characters/", "difficulty": "🟡 Medium" },
      { "id": 438, "title": "找到字符串中所有字母异位词", "url": "https://leetcode.cn/problems/find-all-anagrams-in-a-string/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "子串",
    "problems": [
      { "id": 560, "title": "和为 K 的子数组", "url": "https://leetcode.cn/problems/subarray-sum-equals-k/", "difficulty": "🟡 Medium" },
      { "id": 239, "title": "滑动窗口最大值", "url": "https://leetcode.cn/problems/sliding-window-maximum/", "difficulty": "🔴 Hard" },
      { "id": 76, "title": "最小覆盖子串", "url": "https://leetcode.cn/problems/minimum-window-substring/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "普通数组",
    "problems": [
      { "id": 53, "title": "最大子数组和", "url": "https://leetcode.cn/problems/maximum-subarray/", "difficulty": "🟡 Medium" },
      { "id": 56, "title": "合并区间", "url": "https://leetcode.cn/problems/merge-intervals/", "difficulty": "🟡 Medium" },
      { "id": 189, "title": "轮转数组", "url": "https://leetcode.cn/problems/rotate-array/", "difficulty": "🟡 Medium" },
      { "id": 238, "title": "除了自身以外数组的乘积", "url": "https://leetcode.cn/problems/product-of-array-except-self/", "difficulty": "🟡 Medium" },
      { "id": 41, "title": "缺失的第一个正数", "url": "https://leetcode.cn/problems/first-missing-positive/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "矩阵",
    "problems": [
      { "id": 73, "title": "矩阵置零", "url": "https://leetcode.cn/problems/set-matrix-zeroes/", "difficulty": "🟡 Medium" },
      { "id": 54, "title": "螺旋矩阵", "url": "https://leetcode.cn/problems/spiral-matrix/", "difficulty": "🟡 Medium" },
      { "id": 48, "title": "旋转图像", "url": "https://leetcode.cn/problems/rotate-image/", "difficulty": "🟡 Medium" },
      { "id": 240, "title": "搜索二维矩阵 II", "url": "https://leetcode.cn/problems/search-a-2d-matrix-ii/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "链表",
    "problems": [
      { "id": 160, "title": "相交链表", "url": "https://leetcode.cn/problems/intersection-of-two-linked-lists/", "difficulty": "🟢 Easy" },
      { "id": 206, "title": "反转链表", "url": "https://leetcode.cn/problems/reverse-linked-list/", "difficulty": "🟢 Easy" },
      { "id": 234, "title": "回文链表", "url": "https://leetcode.cn/problems/palindrome-linked-list/", "difficulty": "🟢 Easy" },
      { "id": 141, "title": "环形链表", "url": "https://leetcode.cn/problems/linked-list-cycle/", "difficulty": "🟢 Easy" },
      { "id": 142, "title": "环形链表 II", "url": "https://leetcode.cn/problems/linked-list-cycle-ii/", "difficulty": "🟡 Medium" },
      { "id": 21, "title": "合并两个有序链表", "url": "https://leetcode.cn/problems/merge-two-sorted-lists/", "difficulty": "🟢 Easy" },
      { "id": 2, "title": "两数相加", "url": "https://leetcode.cn/problems/add-two-numbers/", "difficulty": "🟡 Medium" },
      { "id": 19, "title": "删除链表的倒数第 N 个结点", "url": "https://leetcode.cn/problems/remove-nth-node-from-end-of-list/", "difficulty": "🟡 Medium" },
      { "id": 24, "title": "两两交换链表中的节点", "url": "https://leetcode.cn/problems/swap-nodes-in-pairs/", "difficulty": "🟡 Medium" },
      { "id": 25, "title": "K 个一组翻转链表", "url": "https://leetcode.cn/problems/reverse-nodes-in-k-group/", "difficulty": "🔴 Hard" },
      { "id": 138, "title": "随机链表的复制", "url": "https://leetcode.cn/problems/copy-list-with-random-pointer/", "difficulty": "🟡 Medium" },
      { "id": 148, "title": "排序链表", "url": "https://leetcode.cn/problems/sort-list/", "difficulty": "🟡 Medium" },
      { "id": 23, "title": "合并 K 个升序链表", "url": "https://leetcode.cn/problems/merge-k-sorted-lists/", "difficulty": "🔴 Hard" },
      { "id": 146, "title": "LRU 缓存", "url": "https://leetcode.cn/problems/lru-cache/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "二叉树",
    "problems": [
      { "id": 94, "title": "二叉树的中序遍历", "url": "https://leetcode.cn/problems/binary-tree-inorder-traversal/", "difficulty": "🟢 Easy" },
      { "id": 104, "title": "二叉树的最大深度", "url": "https://leetcode.cn/problems/maximum-depth-of-binary-tree/", "difficulty": "🟢 Easy" },
      { "id": 226, "title": "翻转二叉树", "url": "https://leetcode.cn/problems/invert-binary-tree/", "difficulty": "🟢 Easy" },
      { "id": 101, "title": "对称二叉树", "url": "https://leetcode.cn/problems/symmetric-tree/", "difficulty": "🟢 Easy" },
      { "id": 543, "title": "二叉树的直径", "url": "https://leetcode.cn/problems/diameter-of-binary-tree/", "difficulty": "🟢 Easy" },
      { "id": 102, "title": "二叉树的层序遍历", "url": "https://leetcode.cn/problems/binary-tree-level-order-traversal/", "difficulty": "🟡 Medium" },
      { "id": 108, "title": "将有序数组转换为二叉搜索树", "url": "https://leetcode.cn/problems/convert-sorted-array-to-binary-search-tree/", "difficulty": "🟢 Easy" },
      { "id": 98, "title": "验证二叉搜索树", "url": "https://leetcode.cn/problems/validate-binary-search-tree/", "difficulty": "🟡 Medium" },
      { "id": 230, "title": "二叉搜索树中第 K 小的元素", "url": "https://leetcode.cn/problems/kth-smallest-element-in-a-bst/", "difficulty": "🟡 Medium" },
      { "id": 199, "title": "二叉树的右视图", "url": "https://leetcode.cn/problems/binary-tree-right-side-view/", "difficulty": "🟡 Medium" },
      { "id": 114, "title": "二叉树展开为链表", "url": "https://leetcode.cn/problems/flatten-binary-tree-to-linked-list/", "difficulty": "🟡 Medium" },
      { "id": 105, "title": "从前序与中序遍历序列构造二叉树", "url": "https://leetcode.cn/problems/construct-binary-tree-from-preorder-and-inorder-traversal/", "difficulty": "🟡 Medium" },
      { "id": 437, "title": "路径总和 III", "url": "https://leetcode.cn/problems/path-sum-iii/", "difficulty": "🟡 Medium" },
      { "id": 236, "title": "二叉树的最近公共祖先", "url": "https://leetcode.cn/problems/lowest-common-ancestor-of-a-binary-tree/", "difficulty": "🟡 Medium" },
      { "id": 124, "title": "二叉树中的最大路径和", "url": "https://leetcode.cn/problems/binary-tree-maximum-path-sum/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "图论",
    "problems": [
      { "id": 200, "title": "岛屿数量", "url": "https://leetcode.cn/problems/number-of-islands/", "difficulty": "🟡 Medium" },
      { "id": 994, "title": "腐烂的橘子", "url": "https://leetcode.cn/problems/rotting-oranges/", "difficulty": "🟡 Medium" },
      { "id": 207, "title": "课程表", "url": "https://leetcode.cn/problems/course-schedule/", "difficulty": "🟡 Medium" },
      { "id": 208, "title": "实现 Trie (前缀树)", "url": "https://leetcode.cn/problems/implement-trie-prefix-tree/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "回溯",
    "problems": [
      { "id": 46, "title": "全排列", "url": "https://leetcode.cn/problems/permutations/", "difficulty": "🟡 Medium" },
      { "id": 78, "title": "子集", "url": "https://leetcode.cn/problems/subsets/", "difficulty": "🟡 Medium" },
      { "id": 17, "title": "电话号码的字母组合", "url": "https://leetcode.cn/problems/letter-combinations-of-a-phone-number/", "difficulty": "🟡 Medium" },
      { "id": 39, "title": "组合总和", "url": "https://leetcode.cn/problems/combination-sum/", "difficulty": "🟡 Medium" },
      { "id": 22, "title": "括号生成", "url": "https://leetcode.cn/problems/generate-parentheses/", "difficulty": "🟡 Medium" },
      { "id": 79, "title": "单词搜索", "url": "https://leetcode.cn/problems/word-search/", "difficulty": "🟡 Medium" },
      { "id": 131, "title": "分割回文串", "url": "https://leetcode.cn/problems/palindrome-partitioning/", "difficulty": "🟡 Medium" },
      { "id": 51, "title": "N 皇后", "url": "https://leetcode.cn/problems/n-queens/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "二分查找",
    "problems": [
      { "id": 35, "title": "搜索插入位置", "url": "https://leetcode.cn/problems/search-insert-position/", "difficulty": "🟢 Easy" },
      { "id": 74, "title": "搜索二维矩阵", "url": "https://leetcode.cn/problems/search-a-2d-matrix/", "difficulty": "🟡 Medium" },
      { "id": 34, "title": "在排序数组中查找元素的第一个和最后一个位置", "url": "https://leetcode.cn/problems/find-first-and-last-position-of-element-in-sorted-array/", "difficulty": "🟡 Medium" },
      { "id": 33, "title": "搜索旋转排序数组", "url": "https://leetcode.cn/problems/search-in-rotated-sorted-array/", "difficulty": "🟡 Medium" },
      { "id": 153, "title": "寻找旋转排序数组中的最小值", "url": "https://leetcode.cn/problems/find-minimum-in-rotated-sorted-array/", "difficulty": "🟡 Medium" },
      { "id": 4, "title": "寻找两个正序数组的中位数", "url": "https://leetcode.cn/problems/median-of-two-sorted-arrays/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "栈",
    "problems": [
      { "id": 20, "title": "有效的括号", "url": "https://leetcode.cn/problems/valid-parentheses/", "difficulty": "🟢 Easy" },
      { "id": 155, "title": "最小栈", "url": "https://leetcode.cn/problems/min-stack/", "difficulty": "🟡 Medium" },
      { "id": 394, "title": "字符串解码", "url": "https://leetcode.cn/problems/decode-string/", "difficulty": "🟡 Medium" },
      { "id": 739, "title": "每日温度", "url": "https://leetcode.cn/problems/daily-temperatures/", "difficulty": "🟡 Medium" },
      { "id": 84, "title": "柱状图中最大的矩形", "url": "https://leetcode.cn/problems/largest-rectangle-in-histogram/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "堆",
    "problems": [
      { "id": 215, "title": "数组中的第K个最大元素", "url": "https://leetcode.cn/problems/kth-largest-element-in-an-array/", "difficulty": "🟡 Medium" },
      { "id": 347, "title": "前 K 个高频元素", "url": "https://leetcode.cn/problems/top-k-frequent-elements/", "difficulty": "🟡 Medium" },
      { "id": 295, "title": "数据流的中位数", "url": "https://leetcode.cn/problems/find-median-from-data-stream/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "贪心算法",
    "problems": [
      { "id": 121, "title": "买卖股票的最佳时机", "url": "https://leetcode.cn/problems/best-time-to-buy-and-sell-stock/", "difficulty": "🟢 Easy" },
      { "id": 55, "title": "跳跃游戏", "url": "https://leetcode.cn/problems/jump-game/", "difficulty": "🟡 Medium" },
      { "id": 45, "title": "跳跃游戏 II", "url": "https://leetcode.cn/problems/jump-game-ii/", "difficulty": "🟡 Medium" },
      { "id": 763, "title": "划分字母区间", "url": "https://leetcode.cn/problems/partition-labels/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "动态规划",
    "problems": [
      { "id": 70, "title": "爬楼梯", "url": "https://leetcode.cn/problems/climbing-stairs/", "difficulty": "🟢 Easy" },
      { "id": 118, "title": "杨辉三角", "url": "https://leetcode.cn/problems/pascals-triangle/", "difficulty": "🟢 Easy" },
      { "id": 198, "title": "打家劫舍", "url": "https://leetcode.cn/problems/house-robber/", "difficulty": "🟡 Medium" },
      { "id": 279, "title": "完全平方数", "url": "https://leetcode.cn/problems/perfect-squares/", "difficulty": "🟡 Medium" },
      { "id": 322, "title": "零钱兑换", "url": "https://leetcode.cn/problems/coin-change/", "difficulty": "🟡 Medium" },
      { "id": 139, "title": "单词拆分", "url": "https://leetcode.cn/problems/word-break/", "difficulty": "🟡 Medium" },
      { "id": 300, "title": "最长递增子序列", "url": "https://leetcode.cn/problems/longest-increasing-subsequence/", "difficulty": "🟡 Medium" },
      { "id": 152, "title": "乘积最大子数组", "url": "https://leetcode.cn/problems/maximum-product-subarray/", "difficulty": "🟡 Medium" },
      { "id": 416, "title": "分割等和子集", "url": "https://leetcode.cn/problems/partition-equal-subset-sum/", "difficulty": "🟡 Medium" },
      { "id": 32, "title": "最长有效括号", "url": "https://leetcode.cn/problems/longest-valid-parentheses/", "difficulty": "🔴 Hard" }
    ]
  },
  {
    "topic": "多维动态规划",
    "problems": [
      { "id": 62, "title": "不同路径", "url": "https://leetcode.cn/problems/unique-paths/", "difficulty": "🟡 Medium" },
      { "id": 64, "title": "最小路径和", "url": "https://leetcode.cn/problems/minimum-path-sum/", "difficulty": "🟡 Medium" },
      { "id": 5, "title": "最长回文子串", "url": "https://leetcode.cn/problems/longest-palindromic-substring/", "difficulty": "🟡 Medium" },
      { "id": 1143, "title": "最长公共子序列", "url": "https://leetcode.cn/problems/longest-common-subsequence/", "difficulty": "🟡 Medium" },
      { "id": 72, "title": "编辑距离", "url": "https://leetcode.cn/problems/edit-distance/", "difficulty": "🟡 Medium" }
    ]
  },
  {
    "topic": "技巧",
    "problems": [
      { "id": 136, "title": "只出现一次的数字", "url": "https://leetcode.cn/problems/single-number/", "difficulty": "🟢 Easy" },
      { "id": 169, "title": "多数元素", "url": "https://leetcode.cn/problems/majority-element/", "difficulty": "🟢 Easy" },
      { "id": 75, "title": "颜色分类", "url": "https://leetcode.cn/problems/sort-colors/", "difficulty": "🟡 Medium" },
      { "id": 31, "title": "下一个排列", "url": "https://leetcode.cn/problems/next-permutation/", "difficulty": "🟡 Medium" },
      { "id": 287, "title": "寻找重复数", "url": "https://leetcode.cn/problems/find-the-duplicate-number/", "difficulty": "🟡 Medium" }
    ]
  }
];

function escapeHtml(value) {
  return String(value ?? "")
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/\"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

function escapeAttr(value) {
  return escapeHtml(value).replace(/\n/g, " ");
}

function externalLink(url, text) {
  const safeUrl = escapeAttr(url);
  const safeText = escapeHtml(text);
  if (!safeUrl) return safeText;
  return `<a href=\"${safeUrl}\">${safeText}</a>`;
}

function internalLink(path, text) {
  const p = String(path ?? "");
  const safeText = escapeHtml(text ?? p);
  const href = encodeURI(p);
  const dataHref = escapeAttr(p);
  return `<a class=\"internal-link\" data-href=\"${dataHref}\" href=\"${href}\">${safeText}</a>`;
}

function extractLeetCodeIdFromPage(p) {
  const fm = p.leetcode;
  const fromFrontmatter = Number(fm);
  if (Number.isFinite(fromFrontmatter) && fromFrontmatter > 0) return fromFrontmatter;

  const m = String(p.file?.name ?? "").match(/^(\d+)/);
  if (m) {
    const fromName = Number(m[1]);
    if (Number.isFinite(fromName) && fromName > 0) return fromName;
  }

  return null;
}

const pages = dv.pages(`"${ROOT}"`).where((p) => p.type === "algorithm");
const noteById = new Map();
for (const p of pages) {
  const id = extractLeetCodeIdFromPage(p);
  if (id == null) continue;
  if (!noteById.has(id)) noteById.set(id, p);
}

const flat = [];
for (const t of TOPICS) {
  for (const q of t.problems) {
    flat.push({ topic: t.topic, ...q });
  }
}

const total = flat.length;
const doneCount = flat.reduce((acc, q) => acc + (noteById.has(q.id) ? 1 : 0), 0);
const pctNum = total === 0 ? 0 : (doneCount / total) * 100;
const pct = pctNum.toFixed(1);

const barWidth = 20;
const filled = total === 0 ? 0 : Math.round((doneCount / total) * barWidth);
const bar = "█".repeat(filled) + "░".repeat(Math.max(0, barWidth - filled));

let html = "";
html += `<p>我的 LeetCode 100刷题记录。</p>`;

html += `<h2>📊 进度统计</h2>`;
html += `<p><strong>Total Progress</strong>: ${doneCount}/${total} (${pct}%)</p>`;
html += `<p><code>${bar}</code></p>`;

html += `<h2>📝 题目列表 (按专题)</h2>`;

for (const t of TOPICS) {
  const totalInTopic = t.problems.length;
  const doneInTopic = t.problems.reduce((acc, q) => acc + (noteById.has(q.id) ? 1 : 0), 0);
  html += `<h3>${escapeHtml(t.topic)} (${doneInTopic}/${totalInTopic})</h3>`;
  html += `<table>`;
  html += `<thead><tr><th>#</th><th>题目</th><th>难度</th><th>状态</th></tr></thead>`;
  html += `<tbody>`;
  for (const q of t.problems) {
    const p = noteById.get(q.id);
    const isDone = Boolean(p);
    const titleCell = isDone ? internalLink(p.file.path, q.title) : externalLink(q.url, q.title);
    const statusCell = isDone ? "✅" : "⬜";
    html += `<tr>`;
    html += `<td>${q.id}</td>`;
    html += `<td>${titleCell}</td>`;
    html += `<td>${escapeHtml(q.difficulty)}</td>`;
    html += `<td>${statusCell}</td>`;
    html += `</tr>`;
  }
  html += `</tbody>`;
  html += `</table>`;
}

const todos = flat.filter((q) => !noteById.has(q.id));
html += `<h2>🚀 待办清单 (未完成)</h2>`;
html += `<table>`;
html += `<thead><tr><th>#</th><th>题目</th><th>难度</th><th>专题</th></tr></thead>`;
html += `<tbody>`;
for (const q of todos) {
  html += `<tr>`;
  html += `<td>${q.id}</td>`;
  html += `<td>${externalLink(q.url, q.title)}</td>`;
  html += `<td>${escapeHtml(q.difficulty)}</td>`;
  html += `<td>${escapeHtml(q.topic)}</td>`;
  html += `</tr>`;
}
html += `</tbody>`;
html += `</table>`;

dv.container.innerHTML = html;
```
