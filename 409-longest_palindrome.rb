# All letters in palindrome should occur a multiple of 2 times, plus one character that happens a multiple of once.
# For odd numbers, if we've already added one odd number, subtract one and add that (makes it an even number)
# O(N) time, O(1) space because only 52 chars to worry about
def longest_palindrome(s)
  chars = Hash.new(0) # max len 52
  s.chars.each do |c|
    chars[c] += 1
  end

  added_an_odd_number = false
  sum = 0
  chars.each do |k, v|
    if v % 2 == 0
      sum += v
    elsif !added_an_odd_number
      added_an_odd_number = true
      sum += v
    else
      sum += v - 1
    end
  end

  sum
end