input = STDIN.read.chomp.split(' ').map(&:to_i)
puts input.reduce(&:+)