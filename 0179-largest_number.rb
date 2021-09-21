def largest_number(nums)
  sorted = nums.map(&:to_s).sort do |a, b|
    a + b < b + a ? 1 : -1
  end

  sorted[0] == "0" ? "0" : sorted.join
end