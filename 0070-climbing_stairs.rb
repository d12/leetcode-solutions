# @param {Integer} n
# @return {Integer}
# DP - memoization approach
# O(N) time, O(n) space
def climb_stairs(n, memo = {})
  return memo[n] if memo[n]
  return 1 if n == 0
  return 0 if n < 0

  memo[n] = climb_stairs(n-1, memo) + climb_stairs(n-2, memo)
end

# DP - Tabulation with no optimizations
# O(N) time, O(N) space
def climb_stairs(n)
  table = Array.new(45) { 0 }
  table[0] = 1
  table[1] = 2

  table.each_with_index do |_val, i|
    next if i < 2
    table[i] = table[i - 1] + table[i - 2]
  end

  table[n-1]
end

# DP - Tabulation with optimizations - only store last 2
# O(N) time, O(1) space
def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  last_val = 2
  last_last_val = 1
  (n-2).times do |i|
    next_val = last_val + last_last_val
    last_last_val = last_val
    last_val = next_val
  end

  last_val
end