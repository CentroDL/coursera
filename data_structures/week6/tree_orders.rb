# export RUBY_THREAD_VM_STACK_SIZE=5000000
# `ulimit -s unlimited`

class Tree
  attr_accessor :key, :left, :right, :stack

  def initialize(key, left=nil, right=nil)
    @key   = key
    @left  = left
    @right = right
    @stack = []
  end

  def self.in_order(tree)
    return if tree.nil?

    in_order(tree.left)
    print "#{tree.key} "
    in_order(tree.right)
  end

  def self.pre_order(tree)
    return if tree.nil?

    print "#{tree.key} "
    pre_order(tree.left)
    pre_order(tree.right)
  end

  def self.post_order(tree)
    return if tree.nil?

    post_order(tree.left)
    post_order(tree.right)
    print "#{tree.key} "
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

