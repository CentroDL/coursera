# require 'pry'
# output the optimal value output composed of fractional sums
def calculate_max_value(num_items, capacity)
	return 0 if capacity == 0

	items = []
	value = 0

	num_items.times do |i|
		item = {}

		item[:value], item[:weight] = gets.split(' ').map(&:to_f)
		items <<  item
	end

	#compute the value/weight ratios
	items.each do |item|
		item[:ratio] = item[:value] / item[:weight]
	end

	items.sort_by!{ |i| i[:ratio] }.reverse!

	current_weight = 0

	items.each do |item|
		a = [item[:weight], capacity].min
		value += a * item[:ratio]
		capacity -= a
	end

	puts value.round(4)
end

num_items, capacity = gets.split(' ').map(&:to_i)
calculate_max_value(num_items, capacity)
