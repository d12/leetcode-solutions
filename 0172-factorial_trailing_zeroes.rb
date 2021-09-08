# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  # check first 5 powers of 5, since upper bound is 10^4
  p1 = n / 5**1
  p2 = n / 5**2
  p3 = n / 5**3
  p4 = n / 5**4
  p5 = n / 5**5


  p1 + p2 + p3 + p4 + p5
end