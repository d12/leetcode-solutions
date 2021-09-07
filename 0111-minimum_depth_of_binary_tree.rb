
# RECURSIVE DFS

# @param {TreeNode} root
# # @return {Integer}
# def min_depth(root)
#   return 0 unless root
#   min_depth_recursive(root)
# end

# def min_depth_recursive(root)
#   return Float::INFINITY unless root
#   return 1 unless root.left || root.right

#   1 + [min_depth_recursive(root.left), min_depth_recursive(root.right)].min
# end



# ITERATIVE DFS

# def min_depth(root)
#   return 0 unless root

#   stack = [[root, 1]]
#   min_depth = Float::INFINITY

#   while !stack.empty?
#     node, depth = stack.pop

#     if !node.left && !node.right
#       # this is a leaf!
#       min_depth = [min_depth, depth].min
#       next
#     end

#     stack.push([node.right, depth + 1]) if node.right
#     stack.push([node.left, depth + 1]) if node.left
#   end

#   min_depth
# end



# ITERATIVE BFS

def min_depth(root)
  return 0 unless root

  stack = [[root, 1]]

  while !stack.empty?
    node, depth = stack.shift

    if !node.left && !node.right
      return depth
    end

    stack.push([node.right, depth + 1]) if node.right
    stack.push([node.left, depth + 1]) if node.left
  end

  min_depth
end