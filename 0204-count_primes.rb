# Sieve or Eratothenes
def count_primes(n)
  arr = [false] * n

  i = 2 # 2 on the 0 indexed array
  sum = 0
  (i...n).each do |i|
    next if arr[i - 1]

    # Mark all multiples as not prime
    acc = i
    while acc < n
      arr[acc - 1] = true
      acc += i
    end

    sum += 1
  end

  sum
end