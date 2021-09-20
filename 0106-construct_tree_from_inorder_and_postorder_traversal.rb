# O(N log N) time,
# O(N) space
def build_tree(inorder, postorder)
  return if inorder.empty? || postorder.empty?

  val = postorder.last
  node = TreeNode.new(val)

  index_in_inorder = inorder.index(val)
  nodes_to_left = index_in_inorder
  nodes_to_right = inorder.length - 1 - nodes_to_left

  node.left = build_tree(inorder[0..(index_in_inorder - 1)], postorder[0..(postorder.length - nodes_to_right - 2)]) unless nodes_to_left == 0
  node.right = build_tree(inorder[(index_in_inorder + 1)..-1], postorder[(postorder.length - nodes_to_right - 1)..postorder.length - 2]) unless nodes_to_right == 0

  node
end