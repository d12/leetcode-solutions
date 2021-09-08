# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  s_freq = {}
  t_freq = {}

  s.chars.each do |c|
    s_freq[c] ||= 0
    s_freq[c] += 1
  end

  t.chars.each do |c|
    t_freq[c] ||= 0
    t_freq[c] += 1
  end

  s_freq == t_freq
end