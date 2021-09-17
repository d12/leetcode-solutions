# O(M) time, O(1) space
def rotate(matrix)
  size = matrix.length

  j = 0
  while j < size / 2.0
    offset = 0
    while offset < (size - 1) -  j * 2
      do_rotation(matrix, j, offset)
      offset += 1
    end

    j += 1
  end
end

def do_rotation(matrix, j, offset)
  puts "j: #{j}, offset: #{offset}"
  (a1, a2), (b1, b2), (c1, c2), (d1, d2) = four_indices(matrix.length, j, offset)

  tmp = matrix[a1][a2]
  matrix[a1][a2] = matrix[b1][b2]
  matrix[b1][b2] = matrix[c1][c2]
  matrix[c1][c2] = matrix[d1][d2]
  matrix[d1][d2] = tmp
end

def four_indices(size, j, offset)
  [
    [j + offset, j],
    [size - 1 - j, j + offset],
    [size - 1 - offset - j, size - 1 - j],
    [j, size - 1 - offset - j]
  ]
end