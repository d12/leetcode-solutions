# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  if nums[-1] < target
    return nums.length
  elsif nums[0] > target
    return 0
  end

  lower_index = 0
  upper_index = nums.length - 1

  while lower_index != upper_index
      puts "#{lower_index} - #{upper_index}"
      mid_point = (lower_index + upper_index) / 2
      number = nums[mid_point]

      if number == target
          return mid_point
      end

      if (upper_index - lower_index).abs == 1
          return upper_index
      end

      if number > target
          upper_index = mid_point
      else
          lower_index = mid_point
      end
  end

  lower_index
end