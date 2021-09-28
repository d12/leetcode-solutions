# First solution, do it with a simple hashmap & sort
# Time: O(n log n)
# Space: O(n)
def top_k_frequent(nums, k)
  hash = Hash.new(0)
  nums.each do |i|
    hash[i] += 1
  end

  hash.to_a.sort_by{|val| val[1]}.last(k).map{|a| a[0]}
end

# Second solution: Count all elements in a hashmap, then chuck them all in a MIN heap of size K.
# All remaining elements in the heap at the end are our answers. Pop min after each insertion past K.
# O(n log k) time, O(n) space
class Heap
  def initialize(k)
    @k = k
    @arr = []
  end

  def add(element)
    if @arr.length == @k && @arr.length > 0 && element.frequency < @arr[0].frequency
      # Adding a min, just skip it
      return
    end

    add_element(element)

    if @arr.length > @k
      pop_min
    end
  end

  def all_nums
    @arr.map(&:num)
  end

  private

  def add_element(element)
    @arr << element

    # Bubble element into position
    cur_index = @arr.length - 1
    while cur_index > 0 && element.frequency < @arr[parent_index(cur_index)].frequency
      @arr[cur_index], @arr[parent_index(cur_index)] = @arr[parent_index(cur_index)], @arr[cur_index]
      cur_index = parent_index(cur_index)
    end
  end

  def pop_min
    @arr[0] = @arr.pop

    cur_index = 0
    cur_element = @arr[0]
    while true
      left_freq = @arr[left_child_index(cur_index)] && @arr[left_child_index(cur_index)].frequency
      right_freq = @arr[right_child_index(cur_index)] && @arr[right_child_index(cur_index)].frequency

      if (left_freq && right_freq && left_freq < cur_element.frequency && right_freq < cur_element.frequency)
        if left_freq < right_freq
          # swap left
          @arr[left_child_index(cur_index)], @arr[cur_index] = @arr[cur_index], @arr[left_child_index(cur_index)]
          cur_index = left_child_index(cur_index)
        else
          # swap right
          @arr[right_child_index(cur_index)], @arr[cur_index] = @arr[cur_index], @arr[right_child_index(cur_index)]
          cur_index = right_child_index(cur_index)
        end
      elsif left_freq && left_freq < cur_element.frequency
        @arr[left_child_index(cur_index)], @arr[cur_index] = @arr[cur_index], @arr[left_child_index(cur_index)]
        cur_index = left_child_index(cur_index)
      elsif right_freq && right_freq < cur_element.frequency
        @arr[right_child_index(cur_index)], @arr[cur_index] = @arr[cur_index], @arr[right_child_index(cur_index)]
        cur_index = right_child_index(cur_index)
      else
        return
      end
    end
  end

  def parent_index(index)
    (index - 1) / 2
  end

  def left_child_index(index)
    (index * 2) + 1
  end

  def right_child_index(index)
    (index * 2) + 2
  end
end

class Element
  attr_accessor :num, :frequency

  def initialize(num, frequency)
    @num = num
    @frequency = frequency
  end
end

def top_k_frequent(nums, k)
  heap = Heap.new(k)
  hash = Hash.new(0)
  nums.each do |num|
    hash[num] += 1
  end

  elements = hash.map do |k, v|
    Element.new(k, v)
  end

  elements.each do |element|
    heap.add(element)
  end

  heap.all_nums
end