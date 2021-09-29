# DP problem
# For each cell, recursively check the state of the neighboring cells with a lesser or equal value
# A cells result is the union of the the neighboring results
def pacific_atlantic(heights)
  res = Array.new(heights.length) { Array.new(heights[0].length) { [false, false] } }

  atlantic_to_visit = []
  pacific_to_visit = []
  heights.each_with_index do |row, i|
    row.each_with_index do |val, j|
      atlantic_to_visit << [i, j] if is_bordering_atlantic(i, j)
      pacific_to_visit << [i, j] if is_bordering_pacific(i, j, heights)
    end
  end

  # BFS on atlantic list
  do_bfs(heights, res, atlantic_to_visit, 0)

  # BFS on pacific list
  do_bfs(heights, res, pacific_to_visit, 1)

  final_results = []
  res.each_with_index do |row, i|
    row.each_with_index do |val, j|
      final_results << [i, j] if val == [true, true]
    end
  end

  final_results
end

def is_bordering_atlantic(x, y)
  x == 0 || y == 0
end

def is_bordering_pacific(x, y, heights)
  x == (heights.length - 1) || y == (heights[0].length - 1)
end

def do_bfs(heights, res, starting_list, index_to_set)
  visited = {}
  until starting_list.empty?
    x, y = starting_list.pop
    next if visited[[x, y]]
    visited[[x,y]] = true

    res[x][y][index_to_set] = true
    cur_val = heights[x][y]

    if x > 0 && heights[x-1][y] >= cur_val
      starting_list << [x-1,y]
    end

    if y > 0 && heights[x][y-1] >= cur_val
      starting_list << [x,y-1]
    end

    if x < heights.length - 1 && heights[x+1][y] >= cur_val
      starting_list << [x+1, y]
    end

    if y < heights[0].length - 1 && heights[x][y+1] >= cur_val
      starting_list << [x, y+1]
    end
  end
end