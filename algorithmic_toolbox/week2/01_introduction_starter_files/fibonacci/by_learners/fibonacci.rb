#!/usr/bin/env ruby
# by Andronik Ordian

def calc_fib(n)
  return n if n <= 1

  fibs = [1, 1]

  until fibs.length == n
    fibs << fibs.last(2).reduce(&:+)
  end

  fibs.last
end

if __FILE__ == $0
  n = gets.to_i
  puts "#{calc_fib(n)}"
end
