# @param {Integer} n
# @param {Integer[][]} edges
# @return {Boolean}
#
# A valid tree:
# - Has no cycles
# - Is one structure
#
# So to figure it out, let's do a cycle check
# and then count the num of nodes we've visited
#
# First solution, iterates the graph by turning edges into node objects.
#
class Node
  attr_accessor :neighbors, :val

  def initialize(val)
    @neighbors = []
    @val = val
  end
end

def valid_tree(n, edges)
  if edges.empty?
    return n == 1
  end

  val_to_nodes = {}
  edges.each do |a, b|
    a_node = val_to_nodes[a] ||= Node.new(a)
    b_node = val_to_nodes[b] ||= Node.new(b)
    a_node.neighbors << b
    b_node.neighbors << a
  end

  traversed_nodes = {}
  to_traverse = [[edges[0][0], -1]]
  until to_traverse.empty?
    node_index, prev = to_traverse.pop
    if traversed_nodes[node_index]
      return false
    end

    traversed_nodes[node_index] = true

    val_to_nodes[node_index].neighbors.each do |neighbor_index|
      next if neighbor_index == prev
      to_traverse << [neighbor_index, node_index]
    end
  end

  traversed_nodes.length == n
end

# Can we do this without creating node objects?
# n-1 edges means that we only need to check for a fully connected tree, and not cycles,
# since we cannot be fully connected AND have cycles ANd have n-1 edges.
#
# To check for a fully connected tree, just to a traverse from one node. Keep track of previously visited nodes so we don't revisit.
# Start from any node, it shoudln't matter since we traverse all edges.
#
def valid_tree(n, edges)
  unless edges.length == n - 1
    # A valid tree will always have n - 1 edges
    return false
  end

  if edges.empty?
    return n == 1
  end

  # now build an adjacency list and try traversing.
  adj_list = {}
  edges.each do |a, b|
    adj_list[a] ||= []
    adj_list[a] << b
    adj_list[b] ||= []
    adj_list[b] << a
  end

  # Choose a random node to start with
  start = adj_list.keys.first
  visited = {}
  traverse_tree(start, adj_list, visited)

  visited.length == n
end

def traverse_tree(node_index, adj_list, visited)
  return if visited[node_index]

  visited[node_index] = true

  adj_list[node_index].each do |neighbor|
    traverse_tree(neighbor, adj_list, visited)
  end
end
