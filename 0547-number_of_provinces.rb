# Keep track of "visited" cities
# Iterate through cities 0..n-1
# - If city is already visited, ignore
# - If city is not visited, increment "provinces" counter, then BFS outwards by recursively exploring all connections.
#  - Add all visited nodes during recursion to the same visited hash
# Our final answer is the provinces counter.

# Time complexity: O(n^2)
# Space complexity: O(n)
def find_circle_num(is_connected)
  provinces = 0
  # A set of visited cities
  visited = {}

  number_of_cities = is_connected.length
  number_of_cities.times do |city|
    provinces += explore_city(city, visited, is_connected)
  end

  provinces
end

def explore_city(city, visited, is_connected)
  if visited[city]
    return 0
  end

  visited[city] = true
  is_connected[city].each_with_index do |connected, connected_city|
    next unless connected == 1
    explore_city(connected_city, visited, is_connected)
  end

  1
end