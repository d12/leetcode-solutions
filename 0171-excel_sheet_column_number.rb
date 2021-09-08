# @param {String} column_title
# @return {Integer}
def title_to_number(column_title)
  current_digit = 0
  column_title.reverse!
  letters = ("A".."Z").to_a
  sum = 0

  column_title.chars.each do |char|
    sum += (letters.index(char) + 1) * (26 ** current_digit)
    current_digit += 1
  end

  sum
end