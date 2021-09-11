# O(N) time, O(1) space
# times out
def arrange_coins(n)
  current_val = 0
  while n >= 0
    n -= (current_val + 1)
    current_val += 1
  end

  current_val - 1
end

# (n(n+1))/2 => sum
# (100)(101) / 2 = 5050

# (n)(n+1)/2 = sum
# (n)(n+1)/2 = sum
# n^2 + n = sum * 2
# n^2 + n - (sum * 2) = 0
# n = (-1 +- sqrt(1 - 4(-1 * (sum * 2))))/2
# n = (-1 +- sqrt(1 - 4(-sum * 2)))/2
# n = (-1 +- sqrt(1 + (8 * sum)))/2

#O(1) time, O(1) space
def arrange_coins(n)
  ((-1 + Math.sqrt(1 + (8 * n))) / 2).floor
end