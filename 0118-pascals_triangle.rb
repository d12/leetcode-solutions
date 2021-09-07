
def generate(num_rows)
  triangle = []
  num_rows.times do |row_index|
    if row_index == 0
      triangle << [1]
      next
    end

    row = []
    number_of_elements = row_index + 1
    number_of_elements.times do |i|
      if i == 0 || i == row_index
        row << 1
      else
        row << triangle[row_index - 1][i - 1] + triangle[row_index - 1][i]
      end
    end

    triangle << row
  end

  triangle
end