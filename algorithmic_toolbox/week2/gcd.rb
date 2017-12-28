#!/usr/bin/env ruby

def gcd(a, b)
  b == 0 ? a : gcd(b, a%b)
end

if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{gcd(a, b)}"
end