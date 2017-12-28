def fib_sum_last_digit(n)
  return n if n <= 1

  # for a known modulus this period can be pre-solved, no need to calculate dynamically
  # at worst you calculate up to 60 fibonacci numbers but % 10 so they're all tiny
  paisano_period = 60

  remainder = n % paisano_period

  return remainder if remainder == 0

  fibs = [1,1]

  until fibs.length == remainder
  	fibs << fibs.last(2).reduce(&:+) % 10
  end 

  fibs.reduce(&:+) % 10
end


if __FILE__ == $0
  n = gets.to_i
  puts "#{fib_sum_last_digit(n)}"
end