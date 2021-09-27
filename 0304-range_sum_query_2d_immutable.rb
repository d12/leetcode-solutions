# O(1) time, O(nm) space

class NumMatrix
  def initialize(matrix)
    @matrix = matrix
    @dp = Array.new(matrix.length) { Array.new(matrix[0].length) }

    initialize_dp
    puts @dp.inspect
  end

  def sum_region(row1, col1, row2, col2)
    left = row1 > 0 ? @dp[row1-1][col2] : 0
    right = col1 > 0 ? @dp[row2][col1-1] : 0
    center = row1 > 0 && col1 > 0 ? @dp[row1-1][col1-1] : 0

    @dp[row2][col2] - left - right + center
  end

  private

  def initialize_dp
    @matrix.length.times do |i|
      @matrix[0].length.times do |j|
        if i == 0 && j == 0
          @dp[i][j] = @matrix[i][j]
          next
        end

        left = j > 0 ? @dp[i][j-1] : 0
        right = i > 0 ? @dp[i-1][j] : 0
        center = i > 0 && j > 0 ? @dp[i-1][j-1] : 0
        @dp[i][j] = @matrix[i][j] + left + right - center
      end
    end
  end
end

# Your NumMatrix object will be instantiated and called as such:
# obj = NumMatrix.new(matrix)
# param_1 = obj.sum_region(row1, col1, row2, col2)

# sum [a1, a2, b1, b2] is:

# sum(0,0,b1,b2) - sum(0, 0, b1 - 1, a2 - 1) - sum(0, 0, a1 - 1, b2 - 1) + sum(0, 0, a1 - 1, a2 - 1)