unsorted_inputs = File.read_lines("./input").map { |i| i.to_i }
inputs = unsorted_inputs.sort

differences = Hash(Int32, Int32).new

differences[1] = 1
differences[3] = 0

inputs.sort.each_index do |i|
	if i == inputs.size - 1
		differences[3] += 1
		break
	else 
		compare = inputs[i..i+1]
		puts "Comparing #{compare[0]} and #{compare[1]}"
		diff = compare[1] - compare[0]
		differences[diff] += 1
	end
end

puts "Number of 1 diffs #{differences[1]}"
puts "Number of 3 diffs #{differences[3]}"
puts "Product #{differences[1] * differences[3]}"
	