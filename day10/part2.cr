unsorted_inputs = File.read_lines("./input").map { |i| i.to_i32 }
inputs = [0] + unsorted_inputs.sort

class Counter
	@@count = 0

	def self.count
		@@count
	end

	def self.traverse(data, destination, value, path)
		if value == destination
			@@count += 1
			return
		end

		if data.includes?(value + 1)
			traverse(data, destination, value + 1, path + [value + 1])
		end

		if data.includes?(value + 2)
			traverse(data, destination, value + 2, path + [value + 2])
		end

		if data.includes?(value + 3)
			traverse(data, destination, value + 3, path + [value + 3])
		end
	end
end

Counter.traverse(inputs, inputs.max, inputs.min, [inputs.min])
puts Counter.count