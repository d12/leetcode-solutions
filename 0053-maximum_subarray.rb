# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  any_positive = nums.any? {|i| i > 0}
  if !any_positive
    return nums.max
  end

  max_sum = 0

  acc = 0
  nums.each_with_index do |n, index|
    if n < 0
      if acc > max_sum
        max_sum = acc
      end
    end

    acc += n
    if acc <= 0
      acc = 0
    end
  end

  acc > max_sum ? acc : max_sum
end