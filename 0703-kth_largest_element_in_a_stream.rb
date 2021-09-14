# Linkedlist solution, times out

# class LinkedList
#   attr_accessor :len, :head
#   def initialize(cap)
#     @cap = cap
#     @len = 0
#   end

#   def push(val)
#     if !@head
#       @head = LinkedListNode.new(val)
#     else
#       prev = nil
#       cur = @head

#       while cur && cur.val < val
#         prev = cur
#         cur = cur.next
#       end

#       node = LinkedListNode.new(val)
#       if prev
#         prev.next = node
#       else
#         @head = node
#       end
#       node.next = cur
#     end

#     if @len == @cap
#       @head = @head.next
#     else
#       @len += 1
#     end
#   end

#   def lowest
#     @head.val
#   end
# end

# class LinkedListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#   end
# end

# class KthLargest
#   def initialize(k, nums)
#     @list = LinkedList.new(k)
#     nums.each do |i|
#       @list.push(i)
#     end
#   end

#   def add(val)
#     @list.push(val)
#     @list.lowest
#   end
# end

# Add is O(log N)
class KthLargest
  def initialize(k, nums)
    @heap = MinHeap.new(k)
    nums.each do |num|
      @heap.push(num)
    end
  end

  def add(val)
    @heap.push(val)
    @heap.min
  end
end

class MinHeap
  def initialize(cap)
    @arr = []
    @cap = cap
  end

  def push(val)
    if @arr.empty?
      @arr[0] = val
      return
    end

    return if @arr.length == @cap && val < @arr[0] #don't bother inserting something we're going to pop immediately
    add(val)
    remove_min if @arr.length > @cap
  end

  def min
    @arr[0]
  end

  private

  def add(val)
    @arr << val
    val_index = @arr.length - 1

    while val_index != 0 && parent(val_index) > val
      @arr[parent_index(val_index)], @arr[val_index] = @arr[val_index], parent(val_index)
      val_index = parent_index(val_index)
    end
  end

  def remove_min
    @arr[0] = @arr.pop
    val_index = 0

    while [left_child(val_index) || Float::INFINITY, right_child(val_index) || Float::INFINITY].min < @arr[val_index]
      next_index = (left_child(val_index) || Float::INFINITY) < (right_child(val_index) || Float::INFINITY) ? left_child_index(val_index) : right_child_index(val_index)
      @arr[next_index], @arr[val_index] = @arr[val_index], @arr[next_index]
      val_index = next_index
    end
  end

  private

  def left_child_index(index)
    (index * 2) + 1
  end

  def left_child(index)
    @arr[left_child_index(index)]
  end

  def right_child_index(index)
    (index * 2) + 2
  end

  def right_child(index)
    @arr[right_child_index(index)]
  end

  def parent_index(index)
    (index - 1) / 2
  end

  def parent(index)
    @arr[parent_index(index)]
  end
end