
# Hash solution, O(N) time, O(N) space
def majority_element(nums)
  max_num = nil
  max_count = 0
  hash = {}

  nums.each do |num|
    hash[num] ||= 0
    hash[num] += 1

    if hash[num] > max_count
      max_num = num
      max_count = hash[num]
    end
  end

  max_num
end

# Random solution, O(1) time, O(1) space, sometimes works :)
def majority_element(nums)
  nums.sample
end

# Boyer Moore Voting Algorithm
def majority_element(nums)
  count = 1
  current_nominee = nums[0]

  nums[1..-1].each_with_index do |num, index|
    puts current_nominee
    if num == current_nominee
      count += 1
    else
      count -=1
    end

    if count == 0
      current_nominee = nums[index + 2]
      count = 0
    end
  end

  current_nominee
end
