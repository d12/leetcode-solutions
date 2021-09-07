# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val_to_remove)
  if nums.length == 0
      return 0
  end

  next_index_to_fill = 0

  nums.each_with_index do |num, index|
      if num != val_to_remove
          nums[next_index_to_fill] = num
          next_index_to_fill += 1
      end
  end

  next_index_to_fill
end