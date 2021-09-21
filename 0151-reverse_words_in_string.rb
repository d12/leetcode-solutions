# O(N) time, O(N) space
def reverse_words(s)
  words = []

  chars = s.chars
  last_char = chars[0]
  current_word = last_char == " " ? "" : last_char

  chars[1..-1].each do |c|
    if last_char != " " && c == " "
      # We just finished a word
      words.unshift current_word
      current_word = ""
    elsif (last_char == " " && c != " ") || (last_char != " " && c != " ")
      # We just started a word OR we're continuing a word
      current_word += c
    end

    last_char = c
  end

  unless current_word.empty?
    words.unshift current_word
  end

  words.join(" ")
end