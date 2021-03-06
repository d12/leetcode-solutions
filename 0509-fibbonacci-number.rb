# Recursive solution
# Using a memo object to cache progress
# O(N) time, O(N) space for recursive call stacks
def fib(n, memo = {})
  return 0 if n == 0
  return 1 if n <= 2
  return memo[n] if memo[n]

  fib(n-1, memo) + fib(n-2, memo)
end

# Tabulating DP solution
# O(N) time, O(N) space
def fib(n)
  # Initialize table
  table = Array.new(n + 1) { 0 }

  # Seed table
  table[0] = 0
  table[1] = 1

  # Populate table

  table.each_with_index do |_val, i|
    next if i == 0 || i == 1 # Already seeded

    table[i] = table[i - 1] + table[i - 2]
  end

  table[n]
end

# Iterative solution, sidesteps limits with recursion depth and stack space
def fib(n)
  memo = {
    0 => 0,
    1 => 1,
    2 => 1,
  }
  to_calculate_stack = [n]

  until to_calculate_stack.empty?
    to_calculate = to_calculate_stack.pop

    if memo[to_calculate]
      next
    end

    if memo[to_calculate - 1]
      memo[to_calculate] = memo[to_calculate - 1] + memo[to_calculate - 2]
      next
    else
      to_calculate_stack << to_calculate
      to_calculate_stack << to_calculate - 1
    end
  end

  memo[n]
end