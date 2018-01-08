# require 'pry'
# output the optimal value output composed of fractional sums
def calculate_max_value(num_items, capacity)
  if capacity == 0
    puts 0
    return
  end

  items = []
  value = 0

  num_items.times do |i|
    item = {}
    item[:value], item[:weight] = gets.split(' ').map(&:to_f)
    items <<  item
  end

  #compute the value/weight ratios
  items.each { |item| item[:ratio] = item[:value] / item[:weight] }
  items.sort_by!{ |i| [ i[:ratio], -i[:weight] ] }.reverse!

  current_weight = 0

  items.each do |item|
    # with each iteration we've already changed the capacity so we roll
    # with whatever's left
    a = [item[:weight], capacity].min
    # whatever you get, the ratio * weight will get you the value
    value += a * item[:ratio]
    capacity -= a
  end

  puts value.round(4)
end

num_items, capacity = gets.split(' ').map(&:to_i)
calculate_max_value(num_items, capacity)
