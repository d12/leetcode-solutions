# O(n + m) time, O(n + m) space
def intersection(nums1, nums2)
  nums1_count = {}
  nums2_count = {}

  nums1.each do |num|
    nums1_count[num] = true
  end

  nums2.each do |num|
    nums2_count[num] = true
  end

  intersection = []

#   nums1_count.each do |k, v|
#     intersection << k if nums2_count[k]
#   end

#   intersection

  nums1_count.keys & nums2_count.keys
end

# Cheeky solution using ruby's array intersection operator
def intersection(nums1, nums2)
  nums1 & nums2
end