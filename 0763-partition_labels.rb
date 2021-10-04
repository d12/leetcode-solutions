# @param {String} s
# @return {Integer[]}
# Go through the array and find first and last occurance of each letter.
# Merge all ranges that have overlap.
# Answer == length of merged ranges

# O(N) time, O(1) space (since bounded to 26 characters)
def partition_labels(s)
  letters_to_ranges = {}
  s.each_char.with_index do |c, i|
    if letters_to_ranges[c]
      letters_to_ranges[c][1] = i
    else
      letters_to_ranges[c] = [i, i]
    end
  end

  puts letters_to_ranges.inspect

  # Now merge ranges
  merged_ranges = []
  letters_to_ranges.each do |_letter, (r_start, r_end)|
    if merged_ranges.empty?
      merged_ranges << [r_start, r_end]
      next
    end

    if r_start <= merged_ranges[-1][1]
      merged_ranges[-1][1] = [r_end, merged_ranges[-1][1]].max
    else
      merged_ranges << [r_start, r_end]
    end
  end

  merged_ranges.map do |start, stop|
    stop - start + 1
  end
end