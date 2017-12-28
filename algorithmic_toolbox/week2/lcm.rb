def gcd(a, b)
  b == 0 ? a : gcd(b, a%b)
end

def lcm(a, b)
  (a * b)/gcd(a,b)
end

if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{lcm(a, b)}"
end
