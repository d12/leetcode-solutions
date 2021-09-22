# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p, q)
  p_path = nil
  q_path = nil

  to_explore = [[root, []]]
  until to_explore.empty? || (p_path && q_path)

    node, path = to_explore.pop
    new_path = path + [node]
    if node == p
      p_path = new_path
    elsif node == q
      q_path = new_path
    end

    to_explore << [node.left, new_path] if node.left
    to_explore << [node.right, new_path] if node.right
  end

  max_distance = [p_path.length, q_path.length].min
  max_distance.times do |i|
    if p_path[i] != q_path[i]
      return p_path[i-1]
    end
  end

  return p_path[max_distance - 1]
end