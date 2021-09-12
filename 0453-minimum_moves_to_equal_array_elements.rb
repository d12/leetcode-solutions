# @param {Integer[]} nums
# @return {Integer}
def min_moves(nums)
  sum = nums.sum
  min = nums.min
  nums.min

  sum - (min * nums.length)
end
