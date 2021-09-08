# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  nums_to_most_recent_occurance = {}
  nums.each_with_index do |num, index|
    unless nums_to_most_recent_occurance[num]
      nums_to_most_recent_occurance[num] = index
    else
      if index - nums_to_most_recent_occurance[num] <= k
        return true
      else
        nums_to_most_recent_occurance[num] = index
      end
    end
  end

  false
end