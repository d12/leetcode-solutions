# Let dp[i] be the longest increasing subsequence ending at nums[i]
# Time: O(n^2)
# Space: O(n)
def length_of_lis(nums)
  dp = Array.new(nums.length) { 1 }
  nums.each_with_index do |num, i|
    next if i == 0
    max = 0

    dp[0..(i-1)].each_with_index do |dp, dp_i|
      if num > nums[dp_i]
        max = [max, dp].max
      end
    end

    dp[i] = max + 1
  end

  dp.max
end