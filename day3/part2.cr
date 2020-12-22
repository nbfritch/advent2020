raw_lines = File.read_lines("./input")

def check_slope(data, cx, cy)
    x = 0
    count = 0
    data.each_index do |index|
        if index.divisible_by?(cy)
            line = data[index]

            if line[x % line.size] == '#'
                count += 1
            end
            x += cx
        end
    end

    count
end

results = [
    check_slope(raw_lines, 1, 1),
    check_slope(raw_lines, 3, 1),
    check_slope(raw_lines, 5, 1),
    check_slope(raw_lines, 7, 1),
    check_slope(raw_lines, 1, 2)
]

puts results

total = Int64.new(1)
results.each do |i| total = total * i end
puts total