class Tree
  attr_accessor :key, :left, :right

  def initialize(key, left=nil, right=nil)
    @key   = key
    @left  = left
    @right = right
  end

  # def self.in_order(tree)
  #   return if tree.nil?

  #   in_order(tree.left, accumulator * n)
  #   print "#{tree.key} "
  #   in_order(tree.right, accumulator * n)
  # end
  def self.in_order(tree)
    stack   = []
    current = tree
    done    = false

    while !done
      if !current.nil?
        stack << current
        current = current.left
      else
        if stack.empty?
          done = true
        else
          current = stack.pop
          print "#{current.key} "
          current = current.right
        end
      end
    end
  end

  # def self.pre_order(tree)
  #   return if tree.nil?

  #   print "#{tree.key} "
  #   pre_order(tree.left)
  #   pre_order(tree.right)
  # end
  def self.pre_order(tree)
    stack = []

    current = tree
    stack << tree

    while !stack.empty?
      current = stack.pop
      print "#{current.key} "

      stack << current.right unless current.right.nil?
      stack << current.left  unless current.left.nil?
    end
  end

  # def self.post_order(tree)
  #   return if tree.nil?

  #   post_order(tree.left)
  #   post_order(tree.right)
  #   print "#{tree.key} "
  # end
  def self.post_order(tree)
    stack1 = []
    stack2 = []

    stack1 << tree

    while !stack1.empty?
      current = stack1.pop

      stack2 << current

      stack1 << current.left if current.left
      stack1 << current.right if current.right
    end

    until stack2.empty?
      print "#{stack2.pop.key} "
    end
  end
end

count = gets.to_i

keys   = []
lefts  = []
rights = []

inputs = count.times.map { |i| keys[i], lefts[i], rights[i] = gets.split(' ').map(&:to_i) }

vertices = keys.map { |key| Tree.new( key ) }

lefts.each_with_index do |l, i|
  vertices[i].left = vertices[l] unless l == -1
end

rights.each_with_index do |r, i|
  vertices[i].right = vertices[r] unless r == -1
end

Tree.in_order(vertices.first)
puts "\n"
Tree.pre_order(vertices.first)
puts "\n"
Tree.post_order(vertices.first)

