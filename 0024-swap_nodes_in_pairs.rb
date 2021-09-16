# O(N) time, O(1) space
def swap_pairs(head)
  cur = head
  prev = nil

  if cur && cur.next
    head = cur.next
  end

  while cur && cur.next
    prev.next = cur.next if prev
    prev = cur
    tmp = cur.next.next
    cur.next.next = cur
    cur.next = tmp

    cur = cur.next
  end

  print_list(head)

  head
end

# For debugging
def print_list(node)
  vals = []
  cur = node
  while cur
    puts cur.val
    vals << cur.val
    cur = cur.next
  end
end