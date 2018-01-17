require 'pry'

OPERATIONS = [
  [:divide, 2.0],
  [:divide, 3.0],
  [:subtract, 1]
]

# sub problem
def divide(x, y)
  x / y
end

def subtract(x, y)
  x - y
end

# calculates the dynamic programming table for this problem
def calculate_table(target_num)
  # this is our "table"
  minimum_num_of_steps = [0]

  (1..target_num).each do |num|
    # set an initial value in our table to weigh against
    minimum_num_of_steps[num] = Float::INFINITY

    if num == 1
      minimum_num_of_steps[num] = 0
    else
      # calculate values then get rid of decimals since they wouldn't make sense as indices
      # consider that we're starting with integers anyway so float results don't really work
      values = OPERATIONS.map { |op| self.send(op[0], num, op[1]) }
      values.reject! { |v| v % 1 != 0 }
      # for each valid operation's value, look at the number of steps for the index/number we're at
      # and if it's lower than the current step count in the table overwrite it
      values.each do |value|
          # current_num_steps = minimum_num_of_steps[num - value] + 1
          current_num_steps = minimum_num_of_steps[value] + 1

          if current_num_steps < minimum_num_of_steps[num]
            minimum_num_of_steps[num] = current_num_steps
          end
      end
    end
  end

  minimum_num_of_steps
end


target_num = gets.to_i
dp_table = calculate_table(target_num)
# steps = reconstruct()

puts dp_table.last
# puts steps.join(' ')
# TODO: implement the reconstruction of the table