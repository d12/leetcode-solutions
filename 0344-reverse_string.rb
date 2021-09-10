# O(n) time, O(1) space
def reverse_string(s)
  p1 = 0
  p2 = s.length-1

  while p1 < p2
    tmp  = s[p1]
    s[p1] = s[p2]
    s[p2] = tmp

    p1 += 1
    p2 -= 1
  end
end