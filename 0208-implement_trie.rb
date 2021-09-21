# Insert
#   Time:  O(C) where c is length of string
#   Space: O(C)
# Search
#   Time:  O(C)
#   Space: O(1) new allocations
# Start with
#   Time: O(c)
#   Space O(1) new allocations

class Trie
  def initialize()
    @root = Node.new("")
    @roots = {}
  end

  def insert(word)
    chars = word.chars

    current_node = @root
    chars.each do |c|
      if current_node.children[c]
        current_node = current_node.children[c]
      else
        node = Node.new(c)
        current_node.children[c] = node
        current_node = node
      end
    end

    current_node.is_word = true
  end

  def search(word)
    chars = word.chars

    current_node = @root
    chars.each do |c|
      return false unless current_node.children[c]

      current_node = current_node.children[c]
    end

    return current_node.is_word
  end

  def starts_with(prefix)
    current_node = @root
    prefix.chars.each do |c|
      return false unless current_node.children[c]
      current_node = current_node.children[c]
    end

    true
  end

  class Node
    attr_accessor :children, :is_word
    attr_reader :letter

    def initialize(letter)
      @letter = letter
      @children = {}
      @is_word = false
    end
  end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)