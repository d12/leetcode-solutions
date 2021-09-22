# Practically O(1), we're searching through a max of 126 selections (9 choose 5)
def combination_sum3(k, n)
  possible_combinations = (1..9).to_a.combination(k).to_a

  possible_combinations.select do |a|
    a.sum == n
  end
end