# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
class Node
  attr_accessor :next
  attr_reader :course

  def initialize(course)
    @course = course
    @next = []
  end

  def add_dependency(node)
    @next << node
  end
end


# We will traverse each connection exactly once when searching for cycles
# And we also need to create each node for each connection
# We do 0 work for any courses that aren't mentioned in the prerequisites
# O(2K) == O(K) time where K == prerequisites.length
# O(K) space for verified nodes hash, node hash, and visited hash in case of a completely linear graph.
def can_finish(num_courses, prerequisites)
  node_hash = {}
  prerequisites.each do |(a, b)|
    a_node = if node_hash[a]
      node_hash[a]
    else
      node_hash[a] = Node.new(a)
    end

    b_node = if node_hash[b]
      node_hash[b]
    else
      node_hash[b] = Node.new(b)
    end

    a_node.add_dependency(b_node)
  end

  # Now our graph is made, we need to check if it's cyclic
  verified_nodes = {}

  node_hash.each do |course, node|
    return false unless can_find_end(node, {}, verified_nodes)
  end

  true
end

def can_find_end(node, visited, verified_nodes)
  return true  if verified_nodes[node]

  if node.next.empty?
    verified_nodes[node] = true
    return true
  end

  return false if visited[node]

  visited[node] = true

  node.next.each do |next_node|
    return false unless can_find_end(next_node, visited, verified_nodes)
  end

  visited.delete(node)
  verified_nodes[node] = true
end

# Alternative solution using adjacency lists instead of nodes
def can_finish(num_courses, prerequisites)
  pre_req_map = {}
  prerequisites.each do |a, b|
    pre_req_map[a] ||= []
    pre_req_map[a] << b
    pre_req_map[b] ||= []
  end

  confirmed = {}
  # Check if we can complete each course
  pre_req_map.keys.each do |course|
    return false unless can_finish_course(course, pre_req_map, {}, confirmed)
  end

  true
end

def can_finish_course(course, pre_req_map, visited = {}, confirmed = {})
  return false if visited[course]
  return true if confirmed[course]

  visited[course] = true
  pre_req_map[course].each do |pre_req|
    unless can_finish_course(pre_req, pre_req_map, visited, confirmed)
      return false
    end
  end

  visited.delete(course)

  confirmed[course] = true
end