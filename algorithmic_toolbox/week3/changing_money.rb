change = gets.to_i

coins = 0

DENOMINATIONS = [10, 5, 1]

DENOMINATIONS.each do |denomination|
	count = change/denomination

	if count > 0
		coins  += count
		change -= count * denomination
	end
end


puts coins

