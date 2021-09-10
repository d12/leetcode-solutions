# 2 iterations aproach
# O(n) time (2 iterations through the full list), O(n) space

class Letter
  attr_accessor :count, :first_index

  def initialize(first_index)
    @count = 1
    @first_index = first_index
  end
end

def first_uniq_char(s)
  letter_count = {}

  s.chars.each_with_index do |o, index|
    if letter_count[o]
      letter_count[o].count += 1
    else
      letter_count[o] = Letter.new(index)
    end
  end

  s.chars.each do |o|
    if letter_count[o].count == 1
      return letter_count[o].first_index
    end
  end

  -1
end