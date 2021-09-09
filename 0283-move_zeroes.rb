# O(N^2) time, O(1) space
# We only move each element once, but spend a lot of time searching
def move_zeroes(nums)
  pointer = 0
  while pointer < nums.length - 1
    if nums[pointer] != 0
      pointer += 1
      next
    end

    pointer_2 = pointer + 1
    while nums[pointer_2] == 0 && pointer_2 < nums.length
      pointer_2 += 1
    end

    if pointer_2 >= nums.length
      break
    end

    nums[pointer] = nums[pointer_2]
    nums[pointer_2] = 0

    pointer += 1
  end
end

# O(n) time, O(1) space
def move_zeroes(nums)
  last_non_zero = 0
  nums.length.times do |i|
    if nums[i] != 0
      nums[last_non_zero] = nums[i]
      last_non_zero += 1
    end
  end

  (last_non_zero...(nums.length)).each do |i|
    nums[i] = 0
  end
end