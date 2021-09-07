# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  if !p && !q
    return true
  elsif !p || !q
    return false
  end

  return false unless p.val == q.val
  return false unless is_same_tree(p.left, q.left)
  return is_same_tree(p.right, q.right)
end