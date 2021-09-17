
# Find seam, then do a normal binary search modulo the position of the seam
# O(log n) time, O(1) space
def search(nums, target)
  left = 0
  right = nums.length - 1
  len = nums.length

  if nums[left] > nums[right] # no need if we're already sorted
    while right - left > 1
      mid = (right + left)/2

      # Check which side seam is on
      if nums[left] > nums[mid]
        # left side
        right = mid
      else
        left = mid
        #right side
      end
    end
  else
    right = 0
  end

  start = right

  left = 0
  right = nums.length

  while left < right
    return (start + left) % len  if t_index(nums, left, start, len) == target
    return (start + right) % len if t_index(nums, right, start, len) == target

    mid = (left + right) / 2
    return (start + mid) % len if t_index(nums, mid, start, len) == target

    if target < t_index(nums, mid, start, len)
      right = mid - 1
    else
      left = mid + 1
    end
  end

  -1
end

def t_index(nums, i, start, len)
  start == 0 ? nums[i] : nums[(i + start) % len]
end