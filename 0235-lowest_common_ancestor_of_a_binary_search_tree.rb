# First solution, just traverse to each node and then compare the paths
# O(N) time, O(N) space
def lowest_common_ancestor(root, p, q)
  p_path = [root]
  current = root
  while current.val != p.val
    if current.val > p.val
      current = current.left
    else
      current = current.right
    end

    p_path << current
  end

  q_path = [root]
  current = root
  while current.val != q.val
    if current.val > q.val
      current = current.left
    else
      current = current.right
    end

    q_path << current
  end

  q_path.each_with_index do |path_node, index|
    if path_node != p_path[index]
      return p_path[index - 1]
    end
  end

  q_path.last
end

# Better solution, use the fact that the common ancestor will be the first node where p is to the left and q is to the right, or vice versa.
def lowest_common_ancestor(root, p, q)
  p_val = p.val
  q_val = q.val
  node = root

  while node
    if p_val < node.val && q_val < node.val
      node = node.left
    elsif p_val > node.val && q_val > node.val
      node = node.right
    else
      return node
    end
  end
end