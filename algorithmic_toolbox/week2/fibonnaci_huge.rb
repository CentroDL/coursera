def fibonnaci(n)
  return n if n <= 1

  fibs = [1,1]

  n -= 2

  n.times do |n|
    f1 = fibs.shift
    f2 = fibs.last

    fibs.push(f1 + f2)
  end

  fibs.last
end

def fib_huge_modulo(n, m)
  # calculate fibonnaci sequences, storing them until you've hit the paisano period(p)
  # once calculated, take the fib at position n % p and mod by m

  fibs    = [1,1]
  paisano = { length: 3, period: [1,1] }

  until paisano[:period] == [0,1]
    f1   = fibs.shift
    fibs << f1 + fibs.last
    paisano[:period] = [ paisano[:period].last, fibs.last % m ]
    paisano[:length] += 1
  end

  id = n % (paisano[:length] - 2)
  fibonnaci(id) % m
end


if __FILE__ == $0
  a, b = gets.split().map(&:to_i)
  puts "#{fib_huge_modulo(a, b)}"
end