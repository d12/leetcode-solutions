# O(3N) = O(N) time
# O(N) space
def find_celebrity(n)
  arr = [true] * n
  a = 0
  b = 1

  while a < n
    if b >= n
      a += 1
      b = b + 1
      next
    end

    unless arr[b]
      b += 1
      next
    end

    unless arr[a]
      a += 1
      b = a + 1
      next
    end

    if knows(a, b)
      arr[a] = false
      a += 1
      b = a + 1
    else
      arr[b] = false
      b += 1
    end
  end

  possible_celeb = arr.index(true)
  return -1 unless possible_celeb

  n.times do |i|
    next if i == possible_celeb
    return -1 unless knows(i, possible_celeb)
    return -1 if knows(possible_celeb, i)
  end

  possible_celeb
end