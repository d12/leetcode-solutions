# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  nums1_index = m - 1
  nums2_index = n - 1

  left_to_fill = n

  (nums1.length - 1).downto(0) do |i|
    return if left_to_fill == 0

    if nums1_index < 0 || (nums2[nums2_index] > nums1[nums1_index])
      puts "Adding #{nums2[nums2_index]} from nums2"
      nums1[i] = nums2[nums2_index]
      nums2_index -= 1
      left_to_fill -= 1
    else
      puts "Adding #{nums1[nums1_index]} from nums1."
      nums1[i] = nums1[nums1_index]
      nums1[nums1_index] = 0
      nums1_index -= 1
    end
  end
end