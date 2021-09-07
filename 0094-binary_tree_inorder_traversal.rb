# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  inorder_traversal_recursive(root).compact.flatten
end

def inorder_traversal_recursive(root)
return [] unless root
[inorder_traversal_recursive(root.left), root.val, inorder_traversal_recursive(root.right)]
end