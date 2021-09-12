
# For each land tile, check how many adjacent tiles are water
# O(4N) = O(N) time, where N = MxJ grid dimensions
# O(1) space
def island_perimeter(grid)
  grid.each_with_index.sum do |i_val, i|
    grid[i].each_with_index.sum do |j_val, j|
      next 0 if j_val == 0
      val = [i > 0 ? grid.dig(i-1, j) : 0, j > 0 ? grid.dig(i, j-1) : 0, grid.dig(i+1, j), grid.dig(i, j+1)].count do |val|
        val == 0 || val == nil
      end
    end
  end
end

# TODO: Try this again with BFS/DFS. Can there be "islands"? if not, these will work fine.