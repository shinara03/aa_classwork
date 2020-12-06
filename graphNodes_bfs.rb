require 'set'

class GraphNode

  attr_accessor :val, :neighbors

  def initialize(val)
    @val = val
    @neighbors = []
  end

  def add_neighbor(node)
    @neighbors << node
  end

  def bfs(starting_node,target_value)
    queue = [starting_node]
    visited = Set.new()
    until queue.empty?
      check_node = queue.shift
      visited.add(check_node.val)
      return check_node if check_node.val == target_value
      self.neighbors.each do |neighbor| 
        queue << neighbor unless visited.include?(neighbor.val)
      end
    end
  
    return nil
  end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.add_neighbor(b)
a.add_neighbor(c)
a.add_neighbor(e)
c.add_neighbor(b)
c.add_neighbor(d)
e.add_neighbor(a)
f.add_neighbor(e)

p a.bfs(a, "f")