# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  cache = {}
  nums.each do |num|
    return true if cache[num]
    cache[num] = true
  end

  false
end