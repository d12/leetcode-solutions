# All operations O(1)
# Space: O(C), C == capacity

class Node
  attr_accessor :next, :prev
  attr_reader :key, :val

  def initialize(key, val)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @list_head = nil
    @list_tail = nil
    @hash = {}
  end

  def get(key)
    return -1 unless @hash[key]

    put(key, @hash[key].val)
    @hash[key].val
  end

  def put(key, value)
    if @hash[key]
      # remove the key from the list
      node = @hash[key]
      if node == @list_tail
        @list_tail = node.prev
      elsif node == @list_head
        @list_head = node.next
      end

      next_node = node.next
      prev_node = node.prev

      next_node.prev = prev_node if next_node
      prev_node.next = next_node if prev_node

      @hash.delete(key)
    end

    node = Node.new(key, value)
    node.next = @list_head

    if @list_head && @list_tail
      @list_head.prev = node
      @list_head = node
    else
      @list_head = node
      @list_tail = node
    end

    @hash[key] = node

    pop_if_needed
  end

  private

  def pop_if_needed
    return if @hash.length <= @capacity

    key_to_pop = @list_tail.key
    @hash.delete(key_to_pop)

    new_tail = @list_tail.prev
    new_tail.next = nil

    @list_tail = new_tail
  end
end

# Same complexity, but way more simple
# Slightly cheaty, use the ordered property of a Ruby hash
class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @hash = {}
  end

  def get(key)
    return -1 unless @hash[key]
    val = @hash.delete(key)

    @hash[key] = val
  end

  def put(key, value)
    @hash.delete(key)
    @hash[key] = value

    if @hash.length > @capacity
      @hash.delete(@hash.keys.first)
    end
  end
end