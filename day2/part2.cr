count = 0
File.read_lines("./input").each do |line|
    #line is like "1-3 x: abxjr"
    split = line.split(" ")
    #split is like ["1-3", "x:" "abxjr"]
    range = split[0].split("-")
    #range is like "1-3"
    first_index = range[0].to_i
    second_index = range[1].to_i
    char = split[1][0]
    password = split[2]

    if (password[first_index - 1] == char) ^ (password[second_index - 1] == char)
        count += 1
    end
end

puts count