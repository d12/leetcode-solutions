VOWELS = ['a', 'e', 'i', 'o', 'u']

# @param {String} s
# @return {String}
def reverse_vowels(s)
  p1 = 0
  p2 = s.length - 1

  while p1 < p2
    unless VOWELS.include?(s[p1].downcase)
      p1 += 1
      next
    end

    unless VOWELS.include?(s[p2].downcase)
      p2 -= 1
      next
    end

    s[p1], s[p2] = s[p2], s[p1]
    p1 += 1
    p2 -= 1
  end

  s
end