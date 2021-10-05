# @param {String[][]} tickets
# @return {String[]}
#
# Algorithm:
# - Build adjacency list. Each location maps to a hash of destinations and the number of remaining tickets for that destination.
# - Sort each location map, so the destiations are in lexicographic order.
# - Implement recursive backtracking algorithm. For each of a locations tickets (in order), recursively see if there's a solution if we take that ticket out of the mix. If it doesn't work out, put the ticket back.
# - The first solution we find will be the sorted solution since we're traversing our tickets in lexicographic order.
def find_itinerary(tickets)
  results = []
  adj_list = {}
  tickets.each do |a, b|
    adj_list[a] ||= {}
    adj_list[a][b] ||= 0
    adj_list[a][b] += 1
  end

  adj_list.each do |k, v|
    adj_list[k] = v.sort.to_h
  end

  find_itinerary_backtracking(adj_list, results, ["JFK"], tickets.length + 1)
end

def find_itinerary_backtracking(adj_list, results, current_path, itinerary_len)
  if current_path.length == itinerary_len
    return current_path
  end

  current_loc = current_path.last
  adjacents = adj_list[current_loc]
  return unless adjacents

  adjacents.keys.each do |adjacent_city|
    next unless adj_list[current_loc][adjacent_city] > 0

    adj_list[current_loc][adjacent_city] -= 1
    current_path << adjacent_city

    res = find_itinerary_backtracking(adj_list, results, current_path, itinerary_len)
    return res if res

    current_path.pop
    adj_list[current_loc][adjacent_city] += 1
  end

  nil
end