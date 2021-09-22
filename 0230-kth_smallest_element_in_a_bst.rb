# O(k) time, O(H) space, H = height
def kth_smallest(root, k)
  kth_smallest_recursive(root, [k]).val
end

def kth_smallest_recursive(root, k)
  if root.left
    res = kth_smallest_recursive(root.left, k)
    return res if res
  end

  k[0] -= 1

  if k[0] == 0
    return root
  end

  if root.right
    return kth_smallest_recursive(root.right, k)
  else
    nil
  end
end