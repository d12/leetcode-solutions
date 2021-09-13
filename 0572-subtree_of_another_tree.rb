# Compare postorder traversal at each node using DFS recursion to avoid duplicate calculations.
# Add nils in place of missing children to ensure pre-order traversal is enough to uniquely identify a tree
# Might be O(NxM) because we compare each node to the traversal of the subroot.
def is_subtree(root, sub_root)
  subroot_traversal = recursive_inorder_traversal(sub_root)

  is_subtree_recursive(root, subroot_traversal)[0]
end

def is_subtree_recursive(node, target_traversal_value)
  return [false, [nil]] unless node

  found_left_subtree, left_traversal = is_subtree_recursive(node.left, target_traversal_value)
  return [true, []] if found_left_subtree

  found_right_subtree, right_traversal = is_subtree_recursive(node.right, target_traversal_value)
  return [true, []] if found_right_subtree

  traversal = left_traversal + right_traversal + [node.val]
  traversal_equal = traversal == target_traversal_value
  [traversal == target_traversal_value, traversal]
end

def recursive_inorder_traversal(root)
  return [nil] unless root
  recursive_inorder_traversal(root.left) + recursive_inorder_traversal(root.right)  + [root.val]
end