# -------------------------
# O(N) time, O(N) space
# -------------------------
# def hasCycle(head, cache = {})
#   if !head
#     return false
#   elsif cache[head]
#     return true
#   end

#   cache[head] = true
#   hasCycle(head.next, cache)
# end

# -------------------------
# O(1) time, O(1) space, really shit
# -------------------------
# def hasCycle(head, count = 0)
#   if !head
#     return false
#   elsif count > 10**4
#     return true
#   end

#   hasCycle(head.next, count + 1)
# end

# -------------------------
# O(N) time, O(1) space, best solution
# -------------------------
# Note that the slow pointer cannot stay stationary because a loop may exist that doesn't include the HEAD
# node which would mean the fast pointer would get stuck somewhere and never re-visit the initial HEAD node
#
def hasCycle(head)
  if !head || !head.next
    return false
  end

  slow = head
  fast = head.next

  while slow != fast
    if !slow.next || !fast&.next&.next
      return false
    end

    slow = slow.next
    fast = fast.next.next
  end

  return true
end