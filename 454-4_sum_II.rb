# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer[]} nums3
# @param {Integer[]} nums4
# @return {Integer}
#
# Idea: Reduce four sum to two sum by creating two new arrays. one is all combinations of nums1 and nums2,
#       one is all combinations of nums3 and nums4. These arrays will be 40,000 len max.
#       Then from that, we can solve the problem the same way we solve 2sum. Throw all elements
#       of array 2 in a hash, then iterate through array 1 and lookup -1 * element in the hash. If it exists
#       Then add that sequence as a solution.
#
# Time: O(AB + CD) = O(N^2)
# Space: O(AB + CD) = O(N^2)
def four_sum_count(nums1, nums2, nums3, nums4)
  arr_1 = nums1.product(nums2)
  arr_2 = nums3.product(nums4)

  hash_2 = {}
  arr_2.each do |num3, num4|
    sum = num3 + num4
    hash_2[sum] ||= 0
    hash_2[sum] += 1
  end

  res = 0
  arr_1.each do |a, b|
    sum = a + b
    if hash_2.key?(sum * -1)
      res += hash_2[sum * -1]
    end
  end

  res
end