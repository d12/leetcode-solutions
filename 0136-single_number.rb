# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  seen_once = {}
  nums.each do |num|
    if seen_once[num]
      seen_once.delete(num)
    else
      seen_once[num] = true
    end
  end

  seen_once.first[0]
end