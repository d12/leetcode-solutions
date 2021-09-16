# @param {String} digits
# @return {String[]}
NUMBERS_TO_LETTERS = {
  2 => ["a", "b", "c"],
  3 => ["d", "e", "f"],
  4 => ["g", "h", "i"],
  5 => ["j", "k", "l"],
  6 => ["m", "n", "o"],
  7 => ["p", "q", "r", "s"],
  8 => ["t", "u", "v"],
  9 => ["w", "x", "y", "z"]
}

def letter_combinations(digits, rec = false)
  if digits.length == 0
    return rec ? [""] : []
  end

  combinations = (letter_combinations(digits[1..-1], true)).map do |combination|
    NUMBERS_TO_LETTERS[digits[0].to_i].map do |letter|
      "#{letter}#{combination}"
    end
  end

  combinations.flatten
end