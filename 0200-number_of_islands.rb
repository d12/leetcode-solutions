# Iterate over every tile in map. (DONE)
# For each tile, check if it's already been visited. If so, move on. (DONE)
# Else, add 1 to islands. DONE
# Expand via BFS from the cell. Add each cell to visited
# Move on.
#
# Time: O(N). We visit each node once or twice.
# Space: O(N) for visited list
def num_islands(grid)
  # Store visited indices (i, j)
  visited = {}
  islands = 0

  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      next if visited[[i, j]]
      next if cell == "0"

      islands += 1

      nodes_to_visit = [[i,j]]
      until nodes_to_visit.empty?
        node_i, node_j = nodes_to_visit.shift

        next if grid[node_i][node_j] == "0"
        next if visited[[node_i, node_j]]

        visited[[node_i, node_j]] = true

        nodes_to_visit << [node_i-1, node_j] if node_i > 0
        nodes_to_visit << [node_i, node_j-1] if node_j > 0
        nodes_to_visit << [node_i+1, node_j] if node_i < grid.length - 1
        nodes_to_visit << [node_i, node_j+1] if node_j < grid[0].length - 1
      end
    end
  end

  islands
end