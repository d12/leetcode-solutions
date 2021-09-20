# O(N) time, O(N) space
# Iterative solution
def detectCycle(head)
  seen_nodes = {}

  while head
    if seen_nodes[head]
      return head
    end

    seen_nodes[head] = true
    head = head.next
  end

  nil
end

# Floyd cycle finding algorithm
# O(N) time, O(1) space
def detectCycle(head)
  seen_nodes = {}

  slow = head&.next
  fast = head&.next&.next

  while fast && slow != fast
    fast = fast.next&.next
    slow = slow.next
  end

  return nil unless fast

  # We have a cycle, now we need to find it
  intersection_finder = head

  while intersection_finder != slow
    slow = slow.next
    intersection_finder = intersection_finder.next
  end

  intersection_finder
end
