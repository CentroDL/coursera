
# calculate num of steps
# print intermediate values
def divide_by(x, y)
  x / y.to_f
end

def minus_one(current_value)
  current_value - 1
end

def calculate_steps(target_num)
  values = [target_num]

  until values.last == 1
    current_value = values.last

    values << [ divide_by(current_value, 2),
                divide_by(current_value, 3),
                minus_one(current_value)
              ].reject{ |n| n % 1 != 0 }
              .min
              .to_i
  end

  puts values.count - 1
  puts values.reverse.join(' ')
end


target_num = gets.to_i
calculate_steps(target_num)