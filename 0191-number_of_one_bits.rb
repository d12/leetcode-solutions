# "Rubyist" Solution, not efficient for large numbers or data streams.
def hamming_weight(n)
  n.to_s(2).count("1")
end

# bit-wise loop solution, O(1) for 32 bit integers
def hamming_weight(n)
  32.times.count do |i|
    n & (2 ** i) != 0
  end
end