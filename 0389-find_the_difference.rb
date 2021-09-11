# Hashmap solution
# O(n) time, O(1) space since only 26 letters
def find_the_difference(s, t)
  s_hash = Hash.new(0)
  t_hash = Hash.new(0)

  s.chars.each do |c|
    s_hash[c] += 1
  end

  t.chars.each do |c|
    t_hash[c] += 1
  end

  (s_hash.keys | t_hash.keys).each do |c, v|
    if s_hash[c] != t_hash[c]
      return c
    end
  end
end

# Bitwise solution
# XOR all the elements together. All pairs 0 out leaving just the odd one out.
# O(n) time, O(1) space
def find_the_difference(s, t)
  sum = 0
  (s.chars + t.chars).flatten.each do |c|
    sum  ^= c.ord
  end

  sum.chr
end