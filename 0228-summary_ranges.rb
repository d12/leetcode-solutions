# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  return [] if !nums || nums.empty?
  ranges = []
  begin_of_range = nums.shift
  last_num = begin_of_range
  nums.each do |num|
    if num - last_num != 1
      if last_num == begin_of_range
        ranges << begin_of_range.to_s
      else
        ranges << "#{begin_of_range}->#{last_num}"
      end

      begin_of_range = num
      last_num = num
    end
    last_num = num
  end

  if last_num == begin_of_range
    ranges << begin_of_range.to_s
  else
    ranges << "#{begin_of_range}->#{last_num}"
  end
end