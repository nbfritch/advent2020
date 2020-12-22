data = File.read_lines("./input").map do |line| line.to_i end

results = data.map do |d| data.includes?(2020 - d) ? {d, 2020 - d} : nil end

puts results.compact!
