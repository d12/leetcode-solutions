# O(N) time, O(1) space
def missing_number(nums)
  saw_a_zero = false
  max = 0
  sum = 0

  nums.each do |i|
    max = [max, i].max
    saw_a_zero = true if i == 0

    sum += i
  end

  max_sum = (0..max).to_a.sum # Couldn't remember Gauses formula
  dif = max_sum - sum
  dif == 0 ? (saw_a_zero ? max + 1 : 0) : dif
end