count   = gets.chomp
numbers = gets.chomp.split(' ').map(&:to_i)

# puts numbers.max(2).reduce(&:*) doesnt work in ruby 2.1.5 which is what the course uses
puts numbers.sort.last(2).reduce(&:*)