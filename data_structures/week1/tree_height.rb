# require 'pry'

class TreeHeight
  attr_reader :root, :nodes

  def initialize(input)
    parts   = input.split("\n")
    # construct tree
    count   = parts[0].to_i
    parents = parts[1].split(' ').map(&:to_i)

    @nodes = count.times.map { |i| Node.new( value: i) }

    parents.each_with_index do |parent, id|
      parent_node  = nodes[parent]
      current_node = nodes[id]
      # if you're not the root register with your parent
      if parent != -1
        parent_node.children << current_node
        current_node.parent = parent_node
      end
    end

    root_id = parents.index(-1)
    @root = nodes[root_id]
    update_heights
  end

  def compute_height
    nodes.map(&:height).max
  end

  def update_heights
    q = Queue.new

    root.children.each do |child|
      q << child
    end

    until q.empty?
      node = q.pop

      node.height = node.parent.height + 1
      node.children.each { |c| q << c }
    end
  end
end

class Node
  attr_accessor :value, :children, :height, :parent

  def initialize(value: nil, children: nil)
    @value     = value
    @children  = []
    @height    = 1
    @parent = nil
  end
end

input = $stdin.read
tree  = TreeHeight.new(input)

puts tree.compute_height
