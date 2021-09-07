# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  sorted_array_to_bst_recursive(nums, 0)
end

def sorted_array_to_bst_recursive(nums, current_height)
  return if nums.empty?

  val, left_arr, right_arr = split_array(nums)

  node = TreeNode.new(val)
  node.left = sorted_array_to_bst_recursive(left_arr, current_height + 1)
  node.right = sorted_array_to_bst_recursive(right_arr, current_height + 1)

  node
end

# returns val, left, right
def split_array(nums)
  if nums.length == 1
    return [nums.first, [], []]
  end

  middle_index = nums.length / 2
  [nums[middle_index], nums[0..middle_index - 1], nums[(middle_index + 1)..-1]]
end
