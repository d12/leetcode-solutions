# O(N) time, O(N) space for solution
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

# DP solution
# We know "1" is 1 in binary, and "0" is 0 in binary
# Build off that
# If we haven't seen a specific number, divide by 2 and recursively check that one.
# if a number is odd, add one to the result of the prev number
# Do this for each number. Memoize each result in a memo table
#
# Time: O(N)
# Space: O(N)
def count_bits(num)
  table = Array.new(num + 1) { nil }
  table[0] = 0
  table[1] = 1 if num > 0

  table.each_with_index do |num, i|
    next if num
    table[i] = table[i / 2]
    if i % 2 == 1
      table[i] += 1
    end
  end

  table
end