# O(N) time, O(n^2) space
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