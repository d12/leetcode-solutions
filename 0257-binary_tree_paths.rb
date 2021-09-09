# O(N) time, we visit each node once
# O(N) space to store all the paths and to store the stack. O(logN) in best case, O(N) in worst.
def binary_tree_paths(root)
  paths = []
  binary_tree_paths_recursive(root, [], paths)

  paths.map do |path|
    path.join("->")
  end
end

def binary_tree_paths_recursive(node, path_so_far, paths)
  return unless node

  path_so_far << node.val

  if !node.left && !node.right
    paths << path_so_far.dup
  else
    binary_tree_paths_recursive(node.left, path_so_far, paths)
    binary_tree_paths_recursive(node.right, path_so_far, paths)
  end

  # We re-use this reference instead of duplicating it everywhere, so pop the current element before we go back up the stack.
  path_so_far.pop
end