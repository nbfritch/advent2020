data = File.readlines('./input').map { |line| line.to_i }
result_d = data.map { |f| data.filter { |d| data.include?((2020 - f) - d) } }
result = Set.new(result_d.flatten).to_a
puts result
puts result.reduce(:*)