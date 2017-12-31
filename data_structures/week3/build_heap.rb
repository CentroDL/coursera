def build_heap(size, arr)
	swaps = []

	(size/2).downto(0) do |i|
		sift_down(i, arr, swaps)
	end

	puts swaps.length
	swaps.each { |swap| puts "#{swap[0]} #{swap[1]}" }
end

def sift_down(i, arr, swaps)
	min = i

	left_id  = (2*i) + 1
	if left_id <= arr.size-1 && arr[left_id] < arr[min]
		min = left_id
	end

	right_id = (2*i) + 2 
	if right_id <= arr.size-1 && arr[right_id] < arr[min]
		min = right_id
	end

	if i != min
		arr[i], arr[min] = arr[min], arr[i]
		swaps << [i, min]

		sift_down(min, arr, swaps)
	end
end

element_count = gets.to_i
values        = gets.split(' ').map(&:to_i)
build_heap(element_count, values)
