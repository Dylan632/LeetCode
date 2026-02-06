/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public int maxDepth(TreeNode root) {
        if (root == null) {
            return 0;
        }
        //\u5de6\u53f3\u4e2d\uff0c\u540e\u5e8f
        int leftDepth = maxDepth(root.left);
        int rightDepth = maxDepth(root.right);
        //\u5de6\u53f3\u5b69\u5b50\u7684\u6700\u5927\u6df1\u5ea6+\u6839\u8282\u70b9\u672c\u8eab\uff081\uff09\u5c31\u662f\u4e8c\u53c9\u6811\u7684\u6700\u5927\u6df1\u5ea6
        return Math.max(leftDepth, rightDepth) + 1;
    }
}

