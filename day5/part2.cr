data = File.read_lines("./input").map do |line|
    line.gsub("L", "0").gsub("R", "1").gsub("F", "0").gsub("B", "1").to_i(2)
end

puts (68..970).sum - data.sum