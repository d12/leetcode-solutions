
# O(n) time, O(1) space
def is_subsequence(s, t)
  if s.length == 0
    return true
  end

  s_index = 0
  t.chars.each do |c|
    if c == s[s_index]
      s_index += 1
    end

    if s_index == s.length
      return true
    end
  end

  false
end