# O(N) time, O(log N) space (store one layer of the tree)
def width_of_binary_tree(root)
  max_width = 1
  current_level = []
  current_level << [root.left, -1] if root.left
  current_level << [root.right, 1] if root.right
  next_level = []

  until current_level.empty?
    local_min_width = Float::INFINITY
    local_max_width = -Float::INFINITY
    current_level.each do |node, width|
      local_min_width = width if width < local_min_width
      local_max_width = width if width > local_max_width

      next_level << [node.left, width < 0 ? width * 2 : width * 2 - 1] if node.left
      next_level << [node.right, width > 0 ? width * 2 : width * 2 + 1] if node.right
    end

    layer_width = if local_max_width == local_min_width
      1
    elsif (local_max_width < 0 && local_min_width < 0) || (local_max_width > 0 && local_min_width > 0)
      local_max_width - local_min_width + 1
    else
      local_max_width - local_min_width
    end

    max_width = [max_width, layer_width].max
    current_level = next_level
    next_level = []
  end

  max_width
end
