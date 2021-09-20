# O(N) time, O(N) space
def single_number(nums)
  hash = Hash.new(0)

  nums.each do |num|
    hash[num] += 1
  end

  hash.each do |k, v|
    if v == 1
      return k
    end
  end
end
