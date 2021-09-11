# O(max(n, m)) time, O(n) space
def add_strings(num1, num2)
  digits = [num1.length, num2.length].max
  carry = 0
  result = []
  digits.times do |i|
    digit_1 = i > (num1.length - 1) ? 0 : num1[num1.length - i - 1]
    digit_2 = i > (num2.length - 1) ? 0 : num2[num2.length - i - 1]

    sum = digit_1.to_i + digit_2.to_i + carry
    if sum >= 10
      carry = 1
      sum %= 10
    else
      carry = 0
    end

    result.unshift sum
  end

  if carry == 1
    result.unshift 1
  end

  return result.join("")
end