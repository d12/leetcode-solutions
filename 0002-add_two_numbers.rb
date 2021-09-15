# O(l1 + l2) time
# O(N) space (for the solution)
def add_two_numbers(l1, l2)
  carry = 0
  l1_cur = l1
  l2_cur = l2

  new_list = nil
  cur = nil

  while l1_cur || l2_cur
    val = carry
    val += l1_cur&.val || 0
    val += l2_cur&.val || 0

    carry = val / 10
    val %= 10

    if new_list
      new_node = ListNode.new(val)
      cur.next = new_node
      cur = new_node
    else
      new_list = ListNode.new(val)
      cur = new_list
    end

    l1_cur = l1_cur&.next
    l2_cur = l2_cur&.next
  end

  if carry == 1
    cur.next = ListNode.new(1)
  end

  new_list
end