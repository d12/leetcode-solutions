# @param {Integer} n
# @return {Integer}
# O(N) time, O(n) space
def climb_stairs(n, memo = {})
  return memo[n] if memo[n]
  return 1 if n == 0
  return 0 if n < 0

  memo[n] = climb_stairs(n-1, memo) + climb_stairs(n-2, memo)
end