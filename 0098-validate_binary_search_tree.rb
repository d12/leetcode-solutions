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
# @return {Boolean}
def is_valid_bst(root, upper_bound = Float::INFINITY, lower_bound = -Float::INFINITY)
  return true unless root
  return false if root.val >= upper_bound || root.val <= lower_bound

  is_valid_bst(root.left, root.val, lower_bound) && is_valid_bst(root.right, upper_bound, root.val)
end