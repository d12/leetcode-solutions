# @param {String} a
# @param {String} b
# @return {String}
def add_binary(a, b)
  carry = 0
  sum = []

  max_len = [a.length, b.length].max

  a = a.rjust(max_len, "0")
  b = b.rjust(max_len, "0")

  (max_len - 1).downto(0).each do |i|
    val = carry
    val += a[i].to_i || 0
    val += b[i].to_i || 0

    sum.prepend val % 2
    carry = val / 2
    puts "Carry is #{carry}"
  end

  while carry > 0
    sum.prepend carry % 2
    carry /= 2
  end

  sum.join("")
end