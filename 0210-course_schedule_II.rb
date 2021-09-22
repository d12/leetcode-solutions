# DFS solution
#
# Algorithm:
# Start by creating a doubly linked graph laying out the courses and their dependencies.
# Keep dependency edges and dependent edges distinct.
# Now find all "root" nodes with no dependencies.
# Add these root nodes as the first nodes to the stack.
# Keep a list of "satisfied" nodes
# For each node in the stack:
#  - Pop it off
#  - Check if it's valid to explore
#    - it hasn't been satisfied yet
#    - All of it's dependencies have been satisfied
#  - Add all of it's dependents to the stack
#  - Mark ourself as satisfied.
#
# The ordering of the satisfied nodes is our solution.
#
# There may be times where we hit a node and decide that we can't explore it because it's
# dependents haven't been satisfied yet, even though the node will be valid to explore at
# some point. This is OK because the node will be added to the stack again by one of it's
# other dependencies, and eventually it will be looked at and will have no remaining dependents
# to be processed.
#
# If there is a cycle, the list of "roots" will will exclude the segments of the graph that are
# cyclic. So we can just check to see if the resulting list of satisfied nodes matches the number
# of nodes mentioned in dependencies. If not, we hit a cycle and couldn't process all nodes.
#
# Time: O(E) where E = number of edges. Number of vertices may be a factor but is < E
# Space: O(V) for storing visited nodes. O(E) for storing edges we still need to traverse. So O(E + V) or O(E)


class Node
  attr_accessor :dependencies, :dependents
  attr_reader :course

  def initialize(course)
    @course = course
    @dependencies = []
    @dependents = []
  end

  def add_dependency(node)
    @dependencies << node
  end

  def add_dependent(node)
    @dependents << node
  end
end


def find_order(num_courses, prerequisites)
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
    b_node.add_dependent(a_node)
  end

  # Now our graph is made, we need to find the roots
  root_nodes = node_hash.values.select do |node|
    node.dependencies.empty?
  end

  done_nodes = {}
  nodes_to_explore = root_nodes
  until nodes_to_explore.empty?
    node = nodes_to_explore.pop

    next if done_nodes[node]

    bad_dependency = false
    node.dependencies.each do |dependency|
      unless done_nodes[dependency]
        bad_dependency = true
        break
      end
    end

    next if bad_dependency

    node.dependents.each do |dependent|
      nodes_to_explore << dependent
    end

    done_nodes[node] = true
  end


  res = done_nodes.keys.map(&:course)

  if node_hash.length != res.length
    return []
  end

# Add any courses with no dependencies to the result
  num_courses.times do |i|
    res << i unless node_hash[i]
  end

  res
end