# Iterative solution
# O(N) time, N == number of total nodes in tree
# O(log N) space
def connect(root)
  return unless root

  on_level = [root]
  until on_level.empty?
    next_level = []
    on_level.each_with_index do |node, index|
      node.next = on_level[index + 1]
      next_level << node.left if node.left
      next_level << node.right if node.right
    end

    on_level = next_level
  end

  root
end

# Recursive solution
# O(N) time
# O(H) space counting recursive stack. O(1) space otherwise.
def connect(node, levels = [], current_level = 0)
  return unless node

  if levels[current_level]
    node.next = levels[current_level]
  end

  levels[current_level] = node

  connect(node.right, levels, current_level + 1)
  connect(node.left, levels, current_level + 1)

  node
end