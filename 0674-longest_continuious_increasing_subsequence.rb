# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  max_length = 0
  current_begin_index = 0
  current_num = nil
  nums.each_with_index do |num, index|
    if !current_num
      current_num = num
      current_begin_index = index
    elsif num > current_num
      current_num = num
    else
      max_length = [max_length, index - current_begin_index].max
      current_num = num
      current_begin_index = index
    end
  end

  [max_length, nums.length - current_begin_index].max
end