# Naive solution using hash to store seen messages and the last time we saw them.
# This solution isn't great because it slowly accumulates memory waste.
# We store info about messages that we haven't seen since the beginning of time.
# should_print_message is O(1) time and O(n) space for n unique messages
class Logger
  def initialize()
    # mapping between messages and last timestamp
    @seen_messages = {}
  end

  def should_print_message(timestamp, message)
    unless @seen_messages[message]
      @seen_messages[message] = timestamp
      return true
    end

    should_print = @seen_messages[message] <= timestamp - 10

    @seen_messages[message] = timestamp if should_print
    should_print
  end
end

# Store a hash mapping between messages and a reference to a LinkedList node
# When we process a new message, look through the Doubly linked list from the beginning to see if we need to remove any elements
# To store a new message, add it to the end of linked list, and add a reference to the hash.
# We can check the last time the message was posted by referencing the hash, and then checking the node.
#
# This solution does not accumulate memory over time
# Time: Cleaning the list is ammortized constant time. Everything else is constant time. So O(1)
# Space: O(m) where m is all messages sent in the last 10 seconds as of the last invocation.
class Logger
  class LinkedListNode
    attr_accessor :prev, :next, :timestamp, :message
    def initialize(timestamp, message, prev = nil, next_node = nil)
      @timestamp = timestamp
      @message = message
      @prev = prev
      @next = next_node
    end
  end

  def initialize
    @head = nil
    @tail = nil
    @message_to_node = {}
  end

  def should_print_message(timestamp, message)
    clean_list(timestamp)

    unless @head
      @head = LinkedListNode.new(timestamp, message)
      @tail = @head
      @message_to_node[message] = @head

      return true
    end

    if @message_to_node[message]
      return false
    else
      new_node = LinkedListNode.new(timestamp, message)
      @message_to_node[message] = new_node
      new_node.prev = @head
      @head.next = new_node
      @head = new_node

      return true
    end
  end

  private

  # remove all nodes in the list that came before `timestamp`
  def clean_list(timestamp)
    while @tail && @tail.timestamp <= timestamp - 10
      @message_to_node.delete(@tail.message)
      @tail = @tail.next
      @tail&.prev = nil
    end

    unless @tail
      @head = nil
    end
  end
end