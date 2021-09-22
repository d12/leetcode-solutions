# O(N) time, O(1) space.
# The options list has small fixed size of < 8
def rob(nums)
  if nums.length == 1
    return nums[0]
  elsif nums.length == 2
    return nums.max
  end

  first_num = nums[0]
  options = [
    {
      robbed_first: true,
      robbed_last: true,
      money: first_num
    },
    {
      robbed_first: false,
      robbed_last: false,
      money: 0
    }
  ]

  nums.each_with_index do |money, i|
    next if i == 0

    last_house = i == nums.length - 1
    new_options = []

    options.each do |option|
      # Not robbing is always an option
      new_options << {
        robbed_last: false,
        robbed_first: option[:robbed_first],
        money: option[:money]
      }

      # Robbing is an option if we didn't rob last time. If we robbed the first house, we also can't rob this one if it's the last.
      if !option[:robbed_last] &&  !(last_house && option[:robbed_first])
        new_options << {
          robbed_last: true,
          robbed_first: option[:robbed_first],
          money: option[:money] + money
        }
      end
    end

    options = filter_options(new_options)
  end

  options.max_by {|option| option[:money]}[:money]
end

# For all options with the same robbed_first and robbed_last, pick the one with more money
def filter_options(options)
  options.group_by {|option| [option[:robbed_first],option[:robbed_last]]}.values.map {|array| array.max_by {|obj| obj[:money]}}
end