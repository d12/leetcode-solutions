# @param {Integer[]} nums
# @return {Integer}
#       v
# 0000000111
#        ^
# 0000123
# [1,0],[2,0],[3,0],[4,0],[4,1],[4,2],[4,3]
#
#
# Calculate [0s seen, 1s seen] for each index
# Store a hash mapping from (1s seen - 0s seen) -> array of indexes in the array. Check each one looking for a min. Only look backwards.
# O(N) time, we go through the list to build the dif_to_index hash and the dif array. Then one more iteration to find the max.
# O(N) space
def find_max_length(nums)
  zeros_seen = 0
  ones_seen = 0
  dif_to_indexes = {}
  difs = []

  nums.each_with_index do |num, i|
    if num == 0
      zeros_seen += 1
    else
      ones_seen += 1
    end

    dif = ones_seen - zeros_seen
    dif_to_indexes[dif] ||= i
    difs << dif
  end

  max = 0

  difs.each_with_index do |dif, index|
    if dif == 0
      max = [max, index + 1].max
      next
    end

    if dif_to_indexes[dif]
      first_instance = dif_to_indexes[dif]
      if first_instance > index
        next
      end

      distance = index - first_instance
      max = [max, distance].max
    end
  end

  max
end