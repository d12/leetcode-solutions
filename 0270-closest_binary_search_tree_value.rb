# O(N) average, O(log N) when balanced
# O(1) space
def closest_value(root, target)
  cur = root
  min = Float::INFINITY

  while cur
    if cur.val == target
      return cur.val
    end

    if (target - cur.val).abs < (target - min).abs
      min = cur.val
    end

    if target < cur.val
      # we need to go left
      unless cur.left
        return min
      end

      cur = cur.left
    else
      unless cur.right
        return min
      end

      cur = cur.right
    end
  end
end