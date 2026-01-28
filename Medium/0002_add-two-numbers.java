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
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode p1 = l1, p2 = l2;
        ListNode dummy = new ListNode(-1);
        ListNode p = dummy;
        //\u8fdb\u4f4d\uff0c(\u6bd4\u59828+5=13,carry\u5c31\u662f1)
        int carry = 0;
        while (p1 != null || p2 != null || carry > 0){
            //\u5148\u628a\u4e0a\u4e00\u8f6e\u7684\u8fdb\u4f4d\u62ff\u8fc7\u6765
            int val = carry;
            if (p1 != null){
                val += p1.val;
                p1 = p1.next;
            }
            if (p2 != null){
                val += p2.val;
                p2 = p2.next;
            }
            //\u6b64\u65f6val\u662f\u4e24\u6570\u4e4b\u548c
            carry = val /10;
            val = val % 10;
            p.next = new ListNode(val);
            //\u6307\u9488\u540e\u79fb
            p = p.next;
        }
        return dummy.next;
    }
}

