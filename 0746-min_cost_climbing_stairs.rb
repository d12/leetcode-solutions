# O(N) time, O(n) space since costs is passed as a reference and not modified
def min_cost_climbing_stairs(cost)
  min_cost_climbing_stairs_recursive([0] + cost, 0, {})
end

def min_cost_climbing_stairs_recursive(costs, index, memo)
  return memo[index] if memo[index]
  return 0 if index >= costs.length

  min = [
    min_cost_climbing_stairs_recursive(costs, index + 1, memo),
    min_cost_climbing_stairs_recursive(costs, index + 2, memo)
  ].min

  memo[index] = min + costs[index]
end

# Tabulation
# Min cost for a stair is the min for either of the last 2, plus itself
# O(N) time, O(N) space (table)
def min_cost_climbing_stairs(cost)
  cost = cost + [0]
  table = Array.new(cost.length) { nil }
  table[0] = cost[0]
  table[1] = cost[1]

  table.each_with_index do |_val, i|
    next if i < 2
    table[i] = [table[i-1], table[i-2]].min
    table[i] += cost[i]
  end

  table.last
end

# Tabulation with space optimization
# O(N) time, O(1) space
def min_cost_climbing_stairs(cost)
  cost = cost + [0]

  last = cost[1]
  last_last = cost[0]

  cost[2..-1].each do |cost|
    new_cost = cost + [last, last_last].min
    last_last = last
    last = new_cost
  end

  last
end