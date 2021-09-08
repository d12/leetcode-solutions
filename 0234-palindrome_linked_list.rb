# Copy to array approach. O(N) time, O(N) space
def is_palindrome(head)
  len = length(head)

  if len == 1
    return true
  end

  one_end_index = (len / 2) - 1
  two_begin_index = len % 2 == 0 ? one_end_index + 1 : one_end_index + 2

  a_list = []
  b_list = []

  cur = head
  index = 0
  while cur
    if index <= one_end_index
      a_list.push cur.val
    elsif index >= two_begin_index
      b_list.unshift cur.val
    end

    cur = cur.next
    index += 1
  end

  a_list == b_list
end

# Reverse in-place approach, O(N) time, O(1) space
def is_palindrome(head)
  len = length(head)

  if len == 1
    return true
  elsif len == 2
    return head.val == head.next.val
  elsif len == 3
    return head.val == head.next.next.val
  end

  new_head = reverse_first_half_of_list(head, len)

  result = check_if_reversed_list_is_palindrome(new_head, len)
  reverse_first_half_of_list(new_head, len)

  result
end

def length(head)
  cur = head
  len = 0
  while cur
    cur = cur.next
    len += 1
  end

  len
end

def print_list(list)
  cur = list
  while cur
    puts cur.val
    cur = cur.next
  end
end

def reverse_first_half_of_list(head, len)
  one_end_index = (len / 2) - 1
  two_begin_index = len % 2 == 0 ? one_end_index + 1 : one_end_index + 2

  # We want to reverse everything from 0 to one_end_index

  first = head
  prev = nil
  cur = head
  index = 0
  while cur && index <= one_end_index
    if index == one_end_index
      first.next = cur.next
    end

    tmp = cur.next
    cur.next = prev
    prev = cur
    cur = tmp

    index += 1
  end

  prev
end

def check_if_reversed_list_is_palindrome(head, len)
  one_end_index = (len / 2) - 1
  two_begin_index = len % 2 == 0 ? one_end_index + 1 : one_end_index + 2

  pointer_a = head
  pointer_b = head
  pointer_b_index = 0

  while pointer_b_index != two_begin_index
    pointer_b = pointer_b.next
    pointer_b_index += 1
  end

  while pointer_a && pointer_b
    if pointer_a.val != pointer_b.val
      return false
    end

    pointer_a = pointer_a.next
    pointer_b = pointer_b.next
  end

  true
end