/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public boolean isPalindrome(ListNode head) {
        if (head == null && head.next == null) {
            return true;
        }
        ListNode slow = head, fast = head, pre = head;
        while (fast != null && fast.next != null) {
            pre = slow;
            slow = slow.next;
            fast = fast.next.next;
        }
        //\u5206\u5272\u4e24\u4e2a\u94fe\u8868
        pre.next = null;
        ListNode cur1 = head;
        ListNode cur2 = reverseList(slow);
        //\u82e5\u94fe\u8868\u4e3a\u5947\u6570\uff0c\u5219cur1.val\u4e3anull\u65f6\uff0ccur2.val\u4e3a\u94fe\u8868\u7684\u4e2d\u95f4\u503c\uff0c\u4f46\u6b64\u65f6\u5df2\u7ecf\u4e0d\u9700\u8981\u8003\u8651
        while (cur1 != null) {
            if (cur1.val != cur2.val) {
                return false;
            }
            cur1 = cur1.next;
            cur2 = cur2.next;
        }
        return true;
    }

    ListNode reverseList(ListNode head) {
        //\u53cd\u8f6c\u94fe\u8868
        ListNode temp = null, pre = null, cur = head;
        while (cur != null) {
            temp = cur.next;
            cur.next = pre;
            pre = cur;
            cur = temp;
        }
        return pre;
    }
}

