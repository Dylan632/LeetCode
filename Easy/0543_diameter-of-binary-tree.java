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
    int maxDiameter = 0;
    public int diameterOfBinaryTree(TreeNode root) {
        maxDepth(root);
        return maxDiameter;
    }

    private int maxDepth (TreeNode node){
        if (node == null) {
            return 0;
        }
        //\u540e\u5e8f\u904d\u5386
        int leftHeight = maxDepth(node.left);
        int rightHeight = maxDepth(node.right);
        maxDiameter = Math.max(maxDiameter, leftHeight + rightHeight);
        return Math.max(leftHeight, rightHeight) + 1;
        }
}

