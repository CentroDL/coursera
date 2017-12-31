def fib_partial_sum(m, n)
  return n if n <= 2

  # for a known modulus this period can be pre-solved, no need to calculate dynamically
  # at worst you calculate up to 60 fibonacci numbers but % 10 so they're all tiny
  paisano_period = 60

  start  = (m % paisano_period) - 1
  finish = (n % paisano_period) - 1

  fibs = [1,1]

  until fibs.length == paisano_period-1
  	fibs << fibs.last(2).reduce(&:+) % 10
  end

  fibs[start..finish].reduce(&:+) % 10
end

if __FILE__ == $0
  m, n = gets.split().map(&:to_i)
  puts "#{fib_partial_sum(m, n)}"
end
