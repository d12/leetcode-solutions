# O(n + m) time, O(n + m) space
def intersect(nums1, nums2)
  nums1_count = Hash.new(0)
  nums2_count = Hash.new(0)

  nums1.each do |num|
    nums1_count[num] += 1
  end

  nums2.each do |num|
    nums2_count[num] += 1
  end

  intersection = []

  nums1_count.each do |k, v|
    intersection += [k] * [v, nums2_count[k]].min
  end

  intersection
end

# Q: What if the array is sorted?
# Algorithm:
# Pointer at beginning of A, beginning of B
# 'select' the number at the beginning of a
# move pointer in b forward until we're there or past it
# move a and b pointer forward to count occurances
# start again with next number in A
#
# O(n + m) time, O(1) space
def intersect(nums1, nums2)
  nums1.sort!
  nums2.sort!

  pointer_1 = 0
  pointer_2 = 0

  intersection = []
  while pointer_1 < nums1.length && pointer_2 < nums2.length
    selected = nums1[pointer_1]
    while pointer_2 < nums2.length &&  nums2[pointer_2] < selected
      pointer_2 += 1
    end

    if pointer_2 >= nums2.length
      return intersection
    end

    count = 0
    while nums1[pointer_1] && nums2[pointer_2] && nums1[pointer_1] == nums2[pointer_2]
      count += 1
      pointer_1 += 1
      pointer_2 += 1
    end

    intersection += [selected] * count

    while nums1[pointer_1] && nums1[pointer_1] == selected
      pointer_1 += 1
    end
  end

  intersection
end