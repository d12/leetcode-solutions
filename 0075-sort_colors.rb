# 2 pass linear time solution
# First, sort the 0s
# Then sort the 1s
def sort_colors(nums)
  pointer = 0
  while nums[pointer] == 0
    pointer += 1
  end

  nums.each_with_index do |num, index|
    return if pointer == nums.length
    next if index <= pointer

    if num == 0
      nums[index], nums[pointer] = nums[pointer], nums[index]
    end

    while nums[pointer] == 0
      pointer += 1
    end
  end

  # now sort the 1s
  while nums[pointer] == 1
    pointer += 1
  end

  nums.each_with_index do |num, index|
    return if pointer == nums.length
    next if index <= pointer

    if num == 1
      nums[index], nums[pointer] = nums[pointer], nums[index]
    end

    while nums[pointer] == 1
      pointer += 1
    end
  end
end

# 1 pass solution
def sort_colors(nums)
  left_pointer = 0
  right_pointer = nums.length - 1

  cur = 0
  while cur <= right_pointer
    if nums[cur] == 0
      nums[cur], nums[left_pointer] = nums[left_pointer], nums[cur]
      cur += 1
      left_pointer += 1
    elsif nums[cur] == 2
      nums[cur], nums[right_pointer] = nums[right_pointer], nums[cur]
      right_pointer -= 1
    else
      cur += 1
    end
  end
end