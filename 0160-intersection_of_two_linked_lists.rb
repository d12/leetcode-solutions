# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
# def getIntersectionNode(headA, headB)
#   hash = {}
#   current_head_a = headA

#   while current_head_a
#     hash[current_head_a] = true
#     current_head_a = current_head_a.next
#   end

#   current_head_b = headB
#   while current_head_b
#     if hash[current_head_b]
#       return current_head_b
#     else
#       current_head_b = current_head_b.next
#     end
#   end

#   nil
# end

def getIntersectionNode(headA, headB)
  current_head_a = headA
  intersection = nil

  while current_head_a
    current_head_a.val += 10**6
    current_head_a = current_head_a.next
  end

  current_head_b = headB
  while current_head_b
    if current_head_b.val >= 10**6
      intersection = current_head_b
      break
    end

    current_head_b = current_head_b.next
  end

  current_head_a = headA

  while current_head_a
    current_head_a.val -= 10**6
    current_head_a = current_head_a.next
  end

  intersection
end