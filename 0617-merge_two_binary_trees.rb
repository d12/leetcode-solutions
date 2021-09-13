# O(max(N, M)) time, O(min(N, M)) space
def merge_trees(root1, root2)
  return nil unless root1 || root2

  new_node = TreeNode.new((root1&.val || 0) + (root2&.val || 0))
  new_node.left = merge_trees(root1&.left, root2&.left)
  new_node.right = merge_trees(root1&.right, root2&.right)

  new_node
end