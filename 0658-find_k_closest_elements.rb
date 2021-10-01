# @param {Integer[]} arr
# @param {Integer} k
# @param {Integer} x
# @return {Integer[]}
# 1. Find index of closest element
# 2. Expand a window outwards picking the closer element each time
# 3. Return window
# O(N) time, O(1) space
def find_closest_elements(arr, k, x)
  min_dif = Float::INFINITY
  min_dif_index = 0

  arr.each_with_index do |element, i|
    if (element - x).abs < min_dif
      min_dif = (element - x).abs
      min_dif_index = i
    elsif element > x
      break
    end
  end

  window_left = min_dif_index
  window_right = min_dif_index

  while window_right - window_left + 1 < k
    dif_left = (arr[window_left - 1] - x).abs
    dif_right = arr[window_right + 1] ? (arr[window_right + 1] - x).abs : Float::INFINITY

    if window_left > 0 && (dif_left <= dif_right || dif_right == arr.length - 1)
      window_left -= 1
    else
      window_right += 1
    end
  end

  arr[window_left..window_right]
end