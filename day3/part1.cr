raw_lines = File.read_lines("./input")

x = 0
y = 0
count = 0
raw_lines.each do |line|
    if line[x % line.size] == '#'
        count += 1
    end
    x += 3
end

puts count