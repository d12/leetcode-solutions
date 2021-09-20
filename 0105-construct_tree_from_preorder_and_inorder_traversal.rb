# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  if preorder.empty? || inorder.empty?
    return nil
  end

  val = preorder.first
  node = TreeNode.new(val)

  nodes_in_left = inorder.index(val)
  nodes_in_right = inorder.length - 1 - nodes_in_left

  node.left = build_tree(preorder[1..(nodes_in_left)], inorder[0..(nodes_in_left - 1)])
  node.right = build_tree(preorder[(nodes_in_left+1)..-1], inorder[(nodes_in_left + 1)..-1])

  node
end