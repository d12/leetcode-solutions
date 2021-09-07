def preorder_traversal(root)
  # preorder = root, left, right
  unless root
    return []
  end

  preorder_traversal_recursive(root).flatten.compact
end

def preorder_traversal_recursive(root)
  unless root
    return nil
  end

  [root.val, preorder_traversal_recursive(root.left), preorder_traversal_recursive(root.right)]
end