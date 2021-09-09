# O(N) time, O(1) space, kind of complicated
# Even though we have the inner loop here, it's still O(N) because we skip the outer loop
# forward to where the inner loop ended each time.
def shortest_distance(words_dict, word1, word2)
  min_distance = Float::INFINITY
  index = 0
  while index < words_dict.length
    word = words_dict[index]
    if word != word1 && word != word2
      index += 1
      next
    end

    selected_word = word
    target_word = word == word1 ? word2 : word1

    # If we find the other word, store the distance and bail.
    # If we find ourself, bail.
    inner_loop_distance = 0
    words_dict[(index + 1)..-1].each_with_index do |inner_word, inner_index|
      inner_loop_distance = inner_index
      if inner_word == selected_word
        break
      elsif inner_word == target_word
        min_distance = [inner_index + 1, min_distance].min
        break
      end
    end



    index += inner_loop_distance + 1
  end

  min_distance
end

# O(N) time, O(1) space, cleaner solution
def shortest_distance(words_dict, word1, word2)
  last_word_1 = nil
  last_word_2 = nil
  min_distance = Float::INFINITY

  words_dict.each_with_index do |word, index|
    if word == word1
      last_word_1 = index
    elsif word == word2
      last_word_2 = index
    end

    if last_word_1 && last_word_2
      min_distance = [min_distance, (last_word_2 - last_word_1).abs].min
    end
  end

  min_distance
end