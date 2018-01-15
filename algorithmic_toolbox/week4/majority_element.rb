def majority_rule?(arr)
  counts = {}

  arr.each do |val|
    if counts[val]
      counts[val] += 1
    else
      counts[val] = 1
    end
  end

  if counts.any? { |key, val| val > arr.length/2 }
    puts 1
  else
    puts 0
  end
end

count  = gets.to_i
inputs = gets.split(' ').map(&:to_i)
inputs.sort!

majority_rule?(inputs)
