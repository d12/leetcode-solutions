# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  index = digits.length - 1
  carry = false

  while index >= 0
    if digits[index] != 9
      digits[index] += 1
      return digits
    else
      digits[index] = 0
      carry = true
    end

    index -= 1
  end

  if carry
    digits.prepend 1
  end

  digits
end