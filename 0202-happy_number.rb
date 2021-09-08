# O(n) time, O(n) space
# Iterate through and keep a hash of seen numbers
def is_happy(n)
  seen_numbers = {}

  while n != 1
    if seen_numbers[n]
      return false
    end

    seen_numbers[n] = true

    n = n.to_s.chars.map(&:to_i).sum{|a| a * a }
  end

  true
end

# O(n) time, O(1) space
# Linked list cycle finding algorithm
def is_happy(n)
  slow = n
  fast = next_number(n)

  if slow == 1 || fast == 1
    return true
  end

  while slow != fast
    slow = next_number(slow)

    fast = next_number(next_number(fast))
    if fast == 1
      return true
    end
  end

  return false
end

# Written using "ruby-esque" code
def next_number(n)
  n.to_s.chars.map(&:to_i).sum{|a| a * a }
end

# Written using modulo/division
def next_number(n)
  sum = 0
  while n > 0
    i = n % 10
    sum += i * i
    n /= 10
  end

  sum
end