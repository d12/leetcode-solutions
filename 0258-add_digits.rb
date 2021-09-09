# We were asked to do this in O(1)
# There's a math formula that could be derrived, but you can also
# notice that the max number of iterations needed to arrive at an answer is 3.
# So, just calculate the next digit 3 times and return the answer.
# This is O(1).

def add_digits(num)
  next_digit(next_digit(next_digit(num)))
end

def next_digit(num)
  return num if num < 10

  sum = 0
  while num > 0
    sum += num % 10
    num /= 10
  end

  sum
end