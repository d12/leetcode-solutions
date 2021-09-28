# O(N) time, O(N) space
LETTERS = ("a".."z").to_a
def valid_word_abbreviation(word, abbr)
  parsed_abbr = parse_abbr(abbr)
  return false unless abbr_valid?(parsed_abbr)

  word_pointer = 0
  parsed_abbr.each do |token|
    if LETTERS.include?(token)
      if word[word_pointer] == token
        word_pointer += 1
      else
        return false
      end
    else
      word_pointer += token.to_i
    end
  end

  word_pointer == word.length
end

def parse_abbr(abbr)
  arr = []
  abbr.chars.each do |c|
    if abbr.empty?
      arr << c
    elsif LETTERS.include?(c)
      arr << c
    else
      if !LETTERS.include?(arr.last) && arr.length > 0
        arr[-1] = arr[-1] + c
      else
        arr << c
      end
    end
  end

  arr
end

def abbr_valid?(parsed_abbr)
  parsed_abbr.each do |token|
    next if LETTERS.include?(token)

    return false if token.start_with?("0")
  end

  true
end