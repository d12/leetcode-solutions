# Brute force, subtract divisor from dividend until we hit < divisor
# TOO SLOW
# Times out
def divide(dividend, divisor)
  negative_sign = (dividend < 0 && divisor >= 0) || (dividend >= 0 && divisor < 0)

  remaining = dividend.abs
  abs_divisor = divisor.abs
  quotient = 0
  while remaining >= abs_divisor
    remaining -= abs_divisor
    quotient += 1
  end

  negative_sign ? "-#{quotient.to_s}".to_i : quotient
end


# Multiply divisor by 2 using left shift until it doesn't go in any more.
# Add the multiplier to our quotient.
# Repeat
# dividend / divisor
def divide(dividend, divisor)
  # new_dividend = dividend > 0 : -divident : dividend
  # new_divisor = divisor > 0 : -divisor : divisor

  new_dividend = dividend
  new_divisor = divisor

  quotient = 0
  while new_dividend >= new_divisor
    multiplier = 0
    while (new_divisor << multiplier + 1) < new_dividend
      multiplier += 1
    end

    quotient += (1 << multiplier)
    new_dividend -= new_divisor << multiplier
  end

  quotient
end

def divide(dividend, divisor)
  if dividend == -2**31 && divisor == -1
    return 2**31 - 1
  end
  new_dividend = dividend > 0 ? -dividend : dividend
  new_divisor = divisor > 0 ? -divisor : divisor

  quotient = 0
  while new_dividend <= new_divisor
    puts new_dividend
    multiplier = 0
    while (new_divisor << multiplier + 1) > new_dividend
      multiplier += 1
    end

    quotient -= (1 << multiplier)
    new_dividend -= new_divisor << multiplier
  end

  (dividend > 0 && divisor > 0) || (dividend < 0 && divisor < 0) ? -quotient : quotient
end