def binary_search(arr, low, high, value)
  return -1 if high < low

  mid = (low + (high - low)/ 2).floor

  if value == arr[mid]
    return mid
  elsif value < arr[mid]
    return binary_search(arr, low, mid - 1, value)
  else
    return binary_search(arr, mid + 1, high, value)
  end
end


reference_array = gets.split(' ').map(&:to_i)
search_array    = gets.split(' ').map(&:to_i)

n = reference_array.shift
k = search_array.shift

answers = []

search_array.each_with_index do |value|
  answers << binary_search(reference_array, 0, n-1, value)
end

puts answers.join(' ')