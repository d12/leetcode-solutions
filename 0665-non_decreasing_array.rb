# O(2N) = O(N) time, O(1) space
def check_possibility(a)
  changed_a_val = false

  a.each_with_index do |num, i|
    next if !a[i + 1]
    if a[i] > a[i + 1]
      if changed_a_val
        return false
      end

      if i == 0 || a[i - 1] <= a[i + 1]
        a[i] = a[i + 1]
      else
        a[i + 1] = a[i]
      end
      changed_a_val = true
    end
  end

  if changed_a_val
    a.each_with_index do |num, i|
      next if !a[i + 1]
      if a[i] > a[i + 1]
        return false
      end
    end
  end

  true
end