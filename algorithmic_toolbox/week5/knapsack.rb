def construct_grid(width, height)
  grid = []
  (height + 1).times { |h| grid[h] = Array.new(width+1, 0) }
  grid
end

def get_max_value(capacity, weights)
  values = construct_grid(capacity, weights.length)

  (1..weights.length).each do |weight|
    (1..capacity).each do |cap|
      value_without = values[weight-1][cap]
      values[weight][cap]  = value_without

      if weights[weight-1] <= cap
        value_with = values[weight-1][cap - weights[weight-1]] + weights[weight-1]

        if value_with > value_without
          values[weight][cap] = value_with
        end
      end
    end
  end

  values
end



capacity, bar_count = gets.split(' ').map(&:to_i)
bar_weights         = gets.split(' ').map(&:to_i)

table = get_max_value(capacity, bar_weights)

puts table.map { |row| row.max }.flatten.max
