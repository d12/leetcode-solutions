
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


# BFS solution
# O(N) time, O(N) space
def island_perimiter(grid)
  # First, find a land square

  tile_index = nil
  grid.each_with_index do |outer, i|
    outer.each_with_index do |tile, j|
      if tile == 1
        tile_index = [i, j]
        break
      end
    end

    break if tile_index
  end

  queue = [tile_index]
  visited = {}
  sum = 0

  until queue.empty?
    current_x, current_y = queue.shift
    if visited[[current_x, current_y]]
      next
    else
      visited[[current_x, current_y]] = true
    end

    if grid[current_x][current_y] == 0
      next
    end

    # left
    if current_x == 0 || grid.dig(current_x - 1, current_y) == 0
      sum += 1
    else
      queue << [current_x - 1, current_y]
    end

    # down
    if current_y == 0 || grid.dig(current_x, current_y - 1) == 0
      sum += 1
    else
      queue << [current_x, current_y - 1]
    end

    # right
    if grid.dig(current_x + 1, current_y) == 0
      sum += 1
    else
      queue << [current_x + 1, current_y]
    end

    #up
    if grid.dig(current_x, current_y + 1) == 0
      sum += 1
    else
      queue << [current_x, current_y + 1]
    end
  end

  sum
end