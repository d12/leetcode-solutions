# O(N) time, O(1) space complexity

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  (1..n).map do |i|
    if i % 15 == 0
      "FizzBuzz"
    elsif i % 5 == 0
      "Buzz"
    elsif i % 3 == 0
      "Fizz"
    else
      i.to_s
    end
  end
end