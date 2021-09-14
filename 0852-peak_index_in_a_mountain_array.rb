# @param {Integer[]} arr
# @return {Integer}
def peak_index_in_mountain_array(arr)
  low = 0
  high = arr.length - 1

  while low != high
    current = low + ((high - low) / 2)
    if current != 0 && arr[current - 1] > arr[current]
      high = current
    elsif arr[current + 1] && arr[current + 1] > arr[current]
      low = current + 1
    else
      return current
    end
  end
end