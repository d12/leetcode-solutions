# O(N) time, O(H) space
def sum_of_left_leaves(root, left = false)
  return 0 unless root

  if !root.left && !root.right && left
    return root.val
  end

  sum_of_left_leaves(root.left, true) + sum_of_left_leaves(root.right, false)
end