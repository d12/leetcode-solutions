# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def remove_zero_sum_sublists(head)
  p_sum = 0
  p_sum_to_node = {}
  while true
    removed_one = false
    p_sum = 0
    p_sum_to_node = {}
    cur = head
    while cur
      p_sum += cur.val
      if p_sum == 0 # we can remove everything before this
        head = cur.next
      elsif p_sum_to_node[p_sum]
        other_node = p_sum_to_node[p_sum]
        p_sum_to_node[p_sum] = nil
        other_node.next = cur.next
        removed_one = true
      else
        p_sum_to_node[p_sum] = cur
      end

      cur = cur&.next
    end
    break unless removed_one
  end

  head
end