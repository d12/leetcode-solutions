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
# def is_balanced(root)
#   # maps between nodes and height
#   height_cache = {}
#   is_balanced_recursive(root, height_cache)
# end

def is_balanced(root, height_cache = {})
  return true unless root

  left_depth = max_depth(root.left, height_cache)
  right_depth = max_depth(root.right, height_cache)

  unless (left_depth - right_depth).abs <= 1
    return false
  end

  is_balanced(root.left, height_cache) && is_balanced(root.right, height_cache)
end

def max_depth(node, height_cache)
  return 0 unless node
  return height_cache[node] if height_cache[node]

  height_cache[node] = 1 + [max_depth(node.left, height_cache), max_depth(node.right, height_cache)].max
end