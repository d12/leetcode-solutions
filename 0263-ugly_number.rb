# O(1) time & space
def is_ugly(n)
  if n < 1
    return false
  end

  while n % 2 == 0
    n /= 2
  end

  while n % 3 == 0
    n /= 3
  end

  while n % 5 == 0
    n /= 5
  end

  n == 1
end