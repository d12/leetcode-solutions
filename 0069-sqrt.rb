# @param {Integer} x
# @return {Integer}
# def my_sqrt(x)
#   (1..47_000).each do |i|
#     if(i * i > x)
#       return i - 1
#     end
#   end

#   puts "something went very wrong"
# end

def my_sqrt(x)
  lower_bound = 1
  upper_bound = 47_000

  current = (upper_bound + lower_bound) / 2
  while lower_bound != upper_bound
    puts current
    if(current * current == x)
      return current
    end

    over_value = (current * current >= x)
    prev_is_under = ((current - 1) * (current - 1) < x)
    if over_value && prev_is_under
      return current - 1
    elsif over_value
      # use left half
      upper_bound = upper_bound == current ? upper_bound - 1 : current
      current = (upper_bound + lower_bound) / 2
    else
      # use right half
      lower_bound = lower_bound == current ? lower_bound - 1 : current
      current = (upper_bound + lower_bound) / 2
    end
  end

  current - 1
end