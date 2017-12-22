#!/usr/bin/env ruby
# by Andronik Ordian

def fib_last_digit(n)
  return 1 if n <= 1

  fibs = [1,1]

  n -= 2

  n.times do |n|
    f1 = fibs.shift
    f2 = fibs.last

    fibs.push f1 + f2
  end

  fibs.last % 10
end

if __FILE__ == $0
  n = gets.to_i
  puts "#{fib_last_digit(n)}"
end