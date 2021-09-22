# can solve in place by using some of the bits for old data, some for new data, and then
# making a sweep to fill the board with the new data. 2 passes but completely in place
def game_of_life(board)
  board.each_with_index do |row, i|
    row.each_with_index do |val, j|
      neighbors = living_neighbors(board, i, j)

      board[i][j] += if neighbors < 2 && val % 2 == 1
        0
      elsif neighbors <= 3 && val % 2 == 1
        2
      elsif neighbors > 3 && val % 2 == 1
        0
      elsif neighbors == 3 && val % 2 == 0
        2
      else
        0
      end
    end
  end

  # Check if 2nd bit is set, if so, it's a 1, else its a 0
  board.each_with_index do |row, i|
    row.each_with_index do |val, j|
      board[i][j] = val & 2 == 0 ? 0 : 1
    end
  end
end

def living_neighbors(board, i, j)
  [
    (i > 0 && j > 0) ? board[i-1][j-1] : 0,                # i-1, j-1
    i > 0 ? board[i-1][j] : 0,                             # i-1, j
    (i > 0 && board[i-1][j+1]) ? board[i-1][j+1] : 0,      # i-1, j+1
    (j > 0) ? board[i][j-1] : 0,                           # i,   j-1
    (board[i][j+1]) ? board[i][j+1] : 0,                   # i,   j+1
    (board[i+1] && j > 0) ? board[i+1][j-1] : 0,           # i+1, j-1
    (board[i+1]) ? board[i+1][j] : 0,                      # i+1, j
    (board[i+1] && board[i+1][j+1]) ? board[i+1][j+1] : 0, # i+1, j+1
  ].map{|a| a % 2}.count(1)
end