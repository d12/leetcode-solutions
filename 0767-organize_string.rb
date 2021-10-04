# @param {String} s
# @return {String}
#
# O(N) time, O(1) space
def reorganize_string(s)
  letter_counts = Hash.new(0)
  s.each_char do |c|
    letter_counts[c] += 1
  end

  new_string = ""
  until letter_counts.empty?
    max_char = letter_counts.keys.max_by {|c| c == new_string[-1] ? -1 : letter_counts[c]}
    if max_char == new_string[-1]
      # We ran out of other chars to use
      return ""
    end

    new_string += max_char
    letter_counts[max_char] -= 1
    if letter_counts[max_char] == 0
      letter_counts.delete(max_char)
    end
  end

  new_string
end