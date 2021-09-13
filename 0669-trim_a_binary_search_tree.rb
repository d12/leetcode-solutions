# First approach, way too verbose
# O(N) time, O(h) space
def trim_bst(root, low, high)
  node = first_valid_node(root, low, high)
  return nil unless node

  trim_bst_recursive(node, low, high)

  node
end

def first_valid_node(node, low, high)
  return nil unless node

  if node.val < low
    first_valid_node(node.right, low, high)
  elsif node.val > high
    first_valid_node(node.left, low, high)
  else
    node
  end
end

def trim_bst_recursive(node, low, high)
  return nil if node.val < low || node.val > high

  while node.left && node.left.val < low
    node.left = node.left.right
  end

  while node.right && node.right.val > high
    node.right = node.right.left
  end

  trim_bst_recursive(node.left, low, high) if node.left
  trim_bst_recursive(node.right, low, high) if node.right
end


# Alternative solution, way more tidy
# Same complexity
def trim_bst(root, low, high)
  return nil unless root

  if root.val < low
    return trim_bst(root.right, low, high)
  elsif root.val > high
    return trim_bst(root.left, low, high)
  end

  root.left = trim_bst(root.left, low, high)
  root.right = trim_bst(root.right, low, high)

  root
end