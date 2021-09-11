# Using builtins
def count_segments(s)
  s.split(" ").count
end

# Without builtins
def count_segments(s)
  on_char = false
  sum = 0
  s.chars.each do |c|
    if !on_char && c != " "
      sum += 1
      on_char = true
    end

    on_char = c != " "
  end

  sum
end