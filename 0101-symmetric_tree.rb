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
def is_symmetric(root)
  is_tree_equal(root.left, root.right)
end

def is_tree_equal(a, b)
  if !a && !b
    return true
  elsif !a || !b
    return false
  end

  a.val == b.val &&
    is_tree_equal(a.left, b.right) &&
    is_tree_equal(a.right, b.left)
end