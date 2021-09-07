class MinStackNode
  attr_reader :value, :min

  def initialize(value, min)
    @value = value
    @min = min
  end
end

class MinStack
  def initialize()
    @stack = []
  end

  # O(1)
  def push(val)
    if @stack.empty?
      @stack.push MinStackNode.new(val, val)
    else
      @stack.push MinStackNode.new(val, [val, @stack.last.min].min)
    end
  end

  # O(1)
  def pop()
    @stack.pop.value
  end

  # O(1)
  def top()
    @stack.last.value
  end

  # O(1)
  def get_min()
    @stack.last.min
  end
end