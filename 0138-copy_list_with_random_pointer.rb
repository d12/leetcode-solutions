# Time: O(2N) = O(N)
# Space: O(N) since we store a mapping of old nodes to new nodes
def copyRandomList(head)
  # one pass to copy the list, and store a mapping from old node to new node. Set random to old random
  # then another pass to check each random pointer in new

  old_node_to_new_node = {}
  new_head = nil

  # First pass
  old_cur = head
  new_prev = nil
  while old_cur
    new_node = Node.new(old_cur.val)
    new_head = new_node unless new_head

    new_prev.next = new_node if new_prev

    new_node.random = old_cur.random

    old_node_to_new_node[old_cur] = new_node

    old_cur = old_cur.next
    new_prev = new_node
  end

  # Second pass, correct all random pointers
  cur = new_head
  while cur
    cur.random = old_node_to_new_node[cur.random]
    cur = cur.next
  end

  new_head
end