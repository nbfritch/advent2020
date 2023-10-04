data = File.readlines("./input").map { |line| line.to_i }
result = data.filter { |d| data.include?(2020 - d) }
puts "#{result[0]} * #{result[1]} = #{result[0] * result[1]}"