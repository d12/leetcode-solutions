# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  column_title = []
  letters = ("A".."Z").to_a
  while column_number > 0
    column_title.unshift letters[(column_number % 26) - 1]
    column_number = (column_number - 1) / 26
  end

  column_title.join("")
end