# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}
def remove_elements(head, val)
  cur = head
  prev = nil

  while cur
    if cur.val == val
      if prev
        prev.next = cur.next
        cur = cur.next
      else
        head = head&.next
        cur = head
      end
    else
      prev = cur
      cur = cur.next
    end
  end

  head
end