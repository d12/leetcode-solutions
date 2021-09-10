# @param {String} pattern
# @param {String} s
# @return {Boolean}
# O(N) time, O(N) space
def word_pattern(pattern, s)
  pattern_words = pattern.chars
  s_words = s.split(" ")
  return false unless pattern_words.length == s_words.length

  word_to_pattern_mapping = {}
  pattern_to_word_mapping = {}

  s_words.each_with_index do |a, i|
    if word_to_pattern_mapping[a] || pattern_to_word_mapping[pattern_words[i]]
      unless word_to_pattern_mapping[a] == pattern_words[i]
        return false
      end
    else
      word_to_pattern_mapping[a] = pattern_words[i]
      pattern_to_word_mapping[pattern_words[i]] = a
    end
  end

  true
end