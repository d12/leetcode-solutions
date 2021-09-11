# O(n) time, O(n) space
def find_disappeared_numbers(nums)
  seen_numbers = {}
  nums.each do |num|
    seen_numbers[num] = true
  end

  (1..nums.length).select do |i|
    !seen_numbers[i]
  end
end

# O(N) time, O(1) space
def find_dissappeared_numbers(nums)
  nums.each_with_index do |num, i|
    nums[num - 1] += 1_000_000 if nums[num - 1] < 1_000_000
  end

  res = []
  nums.each_with_index do |num, i|
    if num < 1_000_000
      res << (i + 1)
    end
  end

  nums.each_with_index do |num, i|
    if num > 1_000_000
      nums[i] -= 1_000_000
    end
  end

  res
end