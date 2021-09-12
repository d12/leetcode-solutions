# Brute force, times out
# O(N^2) time, O(1) space
def rotate(nums, k)
  k.times { rotate_once(nums) }
end

def rotate_once(nums)
  tmp = nil
  nums.each_with_index do |num, index|
    nums[index], tmp = tmp, nums[index]
  end
  nums[0] = tmp
end

# Store a duplicate
# O(N) time, O(N) space
def rotate(nums, k)
  nums_copy = nums.dup
  nums.length.times do |i|
    nums[i] = nums_copy[(i - k) % nums.length]
  end
end

# Use builtin rotate method
# Unsure of time/space complexity.
def rotate(nums, k)
  nums.rotate!(-k)
end