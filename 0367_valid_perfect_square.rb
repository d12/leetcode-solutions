# binary search
# O(1) because of constraints
def is_perfect_square(num)
  lower = 1
  upper = [num / 2, 47_000].min

  while lower < upper
    mid = (lower + upper) / 2

    square = mid * mid

    if square == num
      return true
    elsif square < num
      lower = mid + 1
    else
      upper = mid - 1
    end
  end

  lower * lower == num
end