def postorder_traversal(root)
  # preorder = root, left, right
  unless root
    return []
  end

  postorder_traversal_recursive(root).flatten.compact
end

def postorder_traversal_recursive(root)
  unless root
    return nil
  end

  [postorder_traversal_recursive(root.left), postorder_traversal_recursive(root.right), root.val]
end