# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

# @param {Node} node
# @return {Node}
def cloneGraph(node, clones = {})
  return unless node

  return clones[node] if clones[node]
  cur_clone = Node.new(node.val)
  clones[node] = cur_clone
  node.neighbors.each do |neighbor|
    cur_clone.neighbors << cloneGraph(neighbor, clones)
  end

  cur_clone
end