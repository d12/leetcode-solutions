# # Recursive DFS

# def has_path_sum(root, target_sum)
#   return false unless root

#   has_path_sum_recursive(root, target_sum, 0)
# end

# def has_path_sum_recursive(node, target, current)
#   current += node.val

#   if !node.left && !node.right
#     return current == target
#   end

#   left_has_answer = has_path_sum_recursive(node.left, target, current) if node.left
#   return true if left_has_answer

#   right_has_answer = has_path_sum_recursive(node.right, target, current) if node.right
#   return !!right_has_answer
# end



# Iterative BFS

def has_path_sum(root, target_sum)
  return false unless root

  stack = [[root, 0]]

  while !stack.empty?
    node, value = stack.shift
    new_value = value + node.val

    if !node.left && !node.right
      return true if new_value == target_sum
      next
    end

    stack.push([node.left, new_value]) if node.left
    stack.push([node.right, new_value]) if node.right
  end

  false
end