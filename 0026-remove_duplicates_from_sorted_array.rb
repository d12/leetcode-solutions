# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  if nums.length == 0
      return 0
  end

  last_uniq = 0
  cur = 1

  while true
      if(cur == nums.length)
          break
      end

      if nums[cur] != nums[last_uniq]
          nums[last_uniq + 1] = nums[cur]
          last_uniq += 1
      end

      cur += 1
  end

  return last_uniq + 1
end