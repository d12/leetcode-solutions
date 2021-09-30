# Sliding window problem
# Keep track of the number of each char in the window
# The number of switches required for a window is window_size - max(freq.values)
# if number of switches > k, move entire window to the right
# Otherwise, move right side of window to the right

# O(N) time, O(N) space
def character_replacement(s, k)
  window_start = 0
  window_end = 0

  freq = Hash.new(0)
  freq[s[0]] += 1

  max_window_size = 0

  while window_end < s.length
    window_size = window_end - window_start + 1
    max_window_size = [max_window_size, window_size].max

    max_char, max_char_count = freq.max_by{|k,v| v}
    number_of_switches_required = window_size - max_char_count
    if number_of_switches_required < k
      window_end += 1
      freq[s[window_end]] += 1
      next
    end

    if number_of_switches_required == k
      window_end += 1
      freq[s[window_end]] += 1
      unless s[window_end] == max_char
        freq[s[window_start]] -= 1
        window_start += 1
      end
    else
      window_end += 1
      freq[s[window_end]] += 1

      freq[s[window_start]] -= 1
      window_start += 1
    end
  end

  max_window_size
end