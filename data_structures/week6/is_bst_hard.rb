# require 'pry'

class Tree
  attr_accessor :key, :left, :right

  def initialize(key, left=nil, right=nil)
    @key   = key
    @left  = left
    @right = right
  end

  def self.in_order(tree)
    stack   = []
    current = tree
    done    = false
    results = []

    while !done
      if !current.nil?
        stack << current
        current = current.left
      else
        if stack.empty?
          done = true
        else
          current = stack.pop
          # print "#{current.key} "

          return false if results.last && ((current.key < results.last) || (current.left && (current.left.key >= current.key)))

          results << current.key
          current = current.right
        end
      end
    end


    return true
    # results
  end
end

count = gets.to_i

if count > 0
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

  correct = Tree.in_order( vertices[0] )
  # ordered = Tree.in_order(vertices[0])

  # correct = true

  # ordered.each_with_index do |v, i|
  #   if ordered[i+1] && (ordered[i+1] < v)
  #     correct = false
  #   end
  # end
else
  correct = true
end

if correct
  puts "CORRECT"
else
  puts "INCORRECT"
end