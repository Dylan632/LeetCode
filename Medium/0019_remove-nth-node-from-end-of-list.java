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
    public ListNode removeNthFromEnd(ListNode head, int n) {
        ListNode dummy = new ListNode();
        dummy.next = head;
        ListNode fast = dummy;
        ListNode slow = dummy;
        //\u8ba9fast\u5148\u8d70n+1\u6b65\uff0c\u65b9\u4fbf\u505a\u5220\u9664\u64cd\u4f5c\uff0cslow\u6307\u5411\u8981\u5220\u9664\u8282\u70b9\u7684\u4e0a\u4e00\u4e2a\u8282\u70b9
        for (int i = 0; i < n + 1; i++) {
            fast = fast.next;
        }
        while (fast != null) {
            fast = fast.next;
            slow = slow.next;
        }
        if (slow.next != null) {
            slow.next = slow.next.next;
        }
        return dummy.next;
    }
}

