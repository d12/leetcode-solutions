/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public int val;
 *     public ListNode next;
 *     public ListNode(int val=0, ListNode next=null) {
 *         this.val = val;
 *         this.next = next;
 *     }
 * }
 */

public class Solution {
    public ListNode RemoveNthFromEnd(ListNode head, int n) {
        int count = RecursivelyRemoveNthFromEnd(head, n);
        if(count == n)
            return head.next;

        return head;
    }

    public int RecursivelyRemoveNthFromEnd(ListNode cur, int n) {
        if(cur == null) {
            return 0;
        }

        int val = RecursivelyRemoveNthFromEnd(cur.next, n);

        if(val == n) {
            cur.next = cur.next.next;
        }

        return val + 1;
    }
}