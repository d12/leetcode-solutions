# Brute force
# For a letter, move forward until we hit a duplicate
# Keep track of the length of that substring
# Move the first pointer forward by one.
# Repeat

# O(2N) time == O(N)
# O(1) space, cache is a constant size because of constraints and we chuck each cache when we move on to the next char
def length_of_longest_substring(s)
  pointer_a = 0
  pointer_b = 0
  max_len = 0

  while pointer_b < s.length
    cache = {}
    while !cache.key?(s[pointer_b]) && pointer_b < s.length
      cache[s[pointer_b]] = pointer_b
      pointer_b += 1
    end

    break if pointer_b >= s.length

    max_len = [max_len, pointer_b - pointer_a].max
    pointer_a = cache[s[pointer_b]] + 1
    pointer_b = pointer_a
  end

  [max_len, pointer_b - pointer_a].max
end