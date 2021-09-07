def reverse(x)
  negative = x < 0
  reversed = x.to_s.reverse.to_i

  reversed *= -1 if negative

  if(reversed >= (2**31) - 1 || reversed <= (-2)**31)
      return 0
  end

  reversed
end