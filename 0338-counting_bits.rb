# O(N) time, O(1) space
def count_bits(n)
  (n+1).times.map do |i|
    one_bits_in_num(i)
  end
end

# Modifies num, kind of complex. Adds 1 if the last bit is 1, then divides by 2
def one_bits_in_num(num)
  sum = 0
  17.times do |n|
    break if num == 0

    sum += 1 if num % 2 == 1
    num = num / 2
  end

  sum
end

# Checks each bit instead of modifying num
# We only have to go up to 17 because of num constraints
def one_bits_in_num(num)
  17.times.count do |n|
      num & (2**n) != 0
  end
end
