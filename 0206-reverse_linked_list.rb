# Iterative solution
def reverse_list(head)
  return nil unless head

  prev = nil
  cur = head

  while cur
    tmp = cur.next
    cur.next = prev
    prev = cur
    cur = tmp
  end

  prev
end