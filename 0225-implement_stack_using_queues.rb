class MyStack
  def initialize()
    @stacks = [[], []]
    @active_stack_index = 0
  end

  def push(x)
    active_stack.push x
  end

  def pop()
    current = active_stack.shift
    while !active_stack.empty?
      other_stack.push current
      current = active_stack.shift
    end

    switch_stacks

    return current
  end

  def top()
    current = active_stack.shift
    while !active_stack.empty?
      other_stack.push current
      current = active_stack.shift
    end

    other_stack.push current

    switch_stacks

    return current
  end

  def empty()
    active_stack.empty?
  end

  def active_stack
    @stacks[@active_stack_index]
  end

  def other_stack
    @stacks[other_stack_index]
  end

  def switch_stacks
    @active_stack_index = @active_stack_index == 0 ? 1 : 0
  end

  def other_stack_index
    @active_stack_index == 0 ? 1 : 0
  end
end

# Put all elements on one queue
# Push -> put element on stack
# Pop/Top,
#  - Begin moving all elements from one queue to the other
#  - As we take each element off of the old queue, check if the old queue is empty.
#    - If it is, Don't push it to the queue if it's a pop. Return the value
#Empty -> Active stack.empty