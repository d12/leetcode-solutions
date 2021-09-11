# Just using 3 variables
# O(N) time, O(1) space
def third_max(nums)
  max = nil
  next_max = nil
  next_next_max = nil

  nums.each do |i|
    if i == max || i == next_max || i == next_next_max
      next
    end

    if !max || i > max
      next_next_max = next_max
      next_max = max
      max = i
    elsif !next_max || i > next_max
      next_next_max = next_max
      next_max = i
    elsif !next_next_max || i > next_next_max
      next_next_max = i
    end
  end

  next_next_max || max
end

# Using a hash instead
# O(N) time, O(1) space
def third_max(nums)
  maximums = {}
  nums.each do |i|
    maximums[i] = true
    maximums.delete(maximums.keys.min) if maximums.length > 3
  end

  maximums.length == 3 ? maximums.min[0] : maximums.max[0]
end