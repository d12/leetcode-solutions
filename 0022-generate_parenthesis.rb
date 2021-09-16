# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  generate_parenthesis_recursive(n, n)
end

# Number of remaining closed can never be < number of remaining open
# That would mean we've used more closed brackets than open brackets which is illegal
def generate_parenthesis_recursive(open, closed)
  if closed < open || closed < 0 || open < 0
    return []
  end

  if open == 1 && closed == 0
    return ["("]
  elsif open == 0 && closed == 1
    return [")"]
  end

  combinations = []
  combinations += generate_parenthesis_recursive(open - 1, closed).map {|a| "(#{a}"}
  combinations += generate_parenthesis_recursive(open, closed - 1).map {|a| ")#{a}"}

  combinations
end