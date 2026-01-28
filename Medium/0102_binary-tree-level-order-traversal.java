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
    //\u4e8c\u7ef4\u5217\u8868
    public List<List<Integer>> resList = new ArrayList<List<Integer>>();
    public List<List<Integer>> levelOrder(TreeNode root) {
        checkFun(root);
        return resList;

    }
    public void checkFun(TreeNode node) {
        if (node == null) {
            return;
        }
        Queue<TreeNode> que = new LinkedList<TreeNode>();
        // \u6839\u8282\u70b9\u5165\u961f\uff08\u7b2c\u4e00\u4e2a\u4eba\u6765\u6392\u961f\u4e86\uff09
        // que.offer() \u610f\u601d\u5c31\u662f\u201c\u8bf7\u8fdb\u961f\u201d\u3002
        // \u6b64\u65f6\u961f\u5217\u91cc\u53ea\u6709\uff1a[root]
        que.offer(node);

        while (!que.isEmpty()) {
            List<Integer> itemList = new ArrayList<Integer>();
            int len = que.size();

            while (len > 0) {
                // que.poll()\uff1a\u53d6\u51fa\u5e76\u4ece\u961f\u5217\u4e2d\u5220\u9664\u7b2c\u4e00\u4e2a\u8282\u70b9\u3002
                TreeNode tempNode = que.poll();
                itemList.add(tempNode.val);
                if (tempNode.left != null) {
                    que.offer(tempNode.left);
                }
                if (tempNode.right != null) {
                    que.offer(tempNode.right);
                }
                len--;
            }
            resList.add(itemList);
        }
    }
}

