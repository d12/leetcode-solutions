# The guess API is already defined for you.
# @param num, your guess
# @return -1 if my number is lower, 1 if my number is higher, otherwise return 0
# def guess(num)

def guessNumber(n)
  low = 1
  high = n

  while low != high
    mid = (low + high) / 2
    res = guess(mid)

    if res == 0
      return mid
    elsif res == 1
      low = mid + 1
    else
      high = mid
    end
  end

  low
end