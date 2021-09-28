# DP problem
# time: O(target)
# space: O(target) for recursive calls

def combination_sum4(nums, target, memo = {})
  return memo[target] if memo.key?(target)

  if target == 0
    return 1
  elsif target < 0
    return 0
  end

  sum = nums.sum do |num|
    combination_sum4(nums, target-num, memo)
  end

  memo[target] = sum
end