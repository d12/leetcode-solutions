#O(N) time, O(1) space
def is_strobogrammatic(num)
  pointer_a = 0
  pointer_b = num.length - 1

  swap_with_itself_numbers = ["1", "8", "0"]
  swap_with_eachother_numbers = ["6", "9"]

  while pointer_a <= pointer_b
    letter_a = num[pointer_a]
    letter_b = num[pointer_b]

    if swap_with_eachother_numbers.include?(letter_a) || swap_with_eachother_numbers.include?(letter_b)
      return false unless (letter_a == "6" && letter_b == "9") || (letter_a == "9" && letter_b == "6")
    elsif swap_with_itself_numbers.include?(letter_a) || swap_with_itself_numbers.include?(letter_b)
      return false unless letter_a == letter_b
    else
      return false
    end

    pointer_a += 1
    pointer_b -= 1
  end

  true
end