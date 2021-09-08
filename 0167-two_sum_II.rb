def two_sum(numbers, target)
  pointer_a = 0
  pointer_b = numbers.length - 1

  while numbers[pointer_a] + numbers[pointer_b] != target
    if numbers[pointer_a] + numbers[pointer_b] > target
      pointer_b -= 1
    else
      pointer_a += 1
    end
  end

  return [pointer_a + 1, pointer_b + 1]
end