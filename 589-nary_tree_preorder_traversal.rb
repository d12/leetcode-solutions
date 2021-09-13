# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[int]}
def preorder(root)
  return [] unless root
  val = [root.val]
  root.children.map do |child|
    val += preorder(child)
  end

  return val
end