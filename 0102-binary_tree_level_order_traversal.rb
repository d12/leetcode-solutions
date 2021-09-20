# Iterative solution
# O(N) time, O(log N) space not including solution
def level_order(root)
  next_level = root ? [root] : []
  res = []

  until next_level.empty?
    new_next_level = []
    level_vals = []

    next_level.each do |node|
      new_next_level << node.left if node.left
      new_next_level << node.right if node.right
      level_vals << node.val
    end

    res << level_vals
    next_level = new_next_level
  end

  res
end

# Recursive solution
# O(N) time
# O(H) space, H = height of the tree (space is for recursive callstack)
def level_order(root, level = 0, res = [])
  return res unless root

  res << [] unless res[level]
  res[level] << root.val

  level_order(root.left, level + 1, res)
  level_order(root.right, level + 1, res)

  res
end