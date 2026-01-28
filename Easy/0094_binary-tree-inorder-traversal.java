

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
    //\u4e00\u7ef4\u5217\u8868
    public List<Integer> resList = new ArrayList<Integer>();
    public List<Integer> inorderTraversal(TreeNode root) {
        checkFun(root);
        return resList;
    }
    public void checkFun(TreeNode node) {
        if (node == null) {
            return;
        }
        checkFun(node.left);
        //\u4e2d\u5e8f\u904d\u5386\uff0cadd\u5728\u4e2d\u95f4
        resList.add(node.val);
        checkFun(node.right);
    }
}

