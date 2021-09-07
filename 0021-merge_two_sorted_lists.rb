# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  if l2 == nil || l1 == nil
      return l1 || l2
  end

  if(l1.val > l2.val)
     tmp = l1
      l1 = l2
      l2 = tmp
  end

  l1_current = l1
  l2_current = l2

  while true
      puts l1_current&.val
      puts l2_current&.val
      puts "---"

      if l2_current == nil
          break
      end
      if l1_current.next && (l2_current.val <= l1_current.next.val)
          # puts "inserting #{l2_current.val} infront of #{l1_current.next.val}"
          tmp = l1_current.next
          l1_current.next = l2_current
          tmp2 = l2_current.next
          l2_current.next = tmp
          l2_current = tmp2
      else
          if l1_current.next == nil
              l1_current.next = l2_current
              break
          else
              l1_current = l1_current.next
          end
      end
  end

  l1
end