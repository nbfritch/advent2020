count = 0
File.read_lines("./input").each do |line|
    #line is like "1-3 x: abxjr"
    split = line.split(" ")
    #split is like ["1-3", "x:" "abxjr"]
    range = split[0].split("-")
    #range is like "1-3"
    range_low = range[0].to_i
    range_high = range[1].to_i
    char = split[1][0]
    password = split[2]

    occurences = password.count(char)
    if occurences <= range_high && occurences >= range_low
        count += 1
    end
end

puts count