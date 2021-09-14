# O(N) time, O(1) space
def max_dist_to_closest(seats)
  max_distance = 0
  low_pointer = 0

  while low_pointer < seats.length
    high_pointer = low_pointer + 1
    while seats[high_pointer] == 0
      high_pointer += 1
    end

    potential_seat = if !seats[high_pointer]
      high_pointer - low_pointer - 1
    elsif seats[low_pointer] == 0
      high_pointer - low_pointer
    else
      (high_pointer - low_pointer) / 2
    end

    max_distance = [max_distance, potential_seat].max
    low_pointer = high_pointer
  end

  max_distance
end