data = File.read("./input").split("\n\n").map do |group|
    puts group.split("\n")
    groups = group.split("\n").compact_map do |line|
        line.size > 0 ? line.chars.to_set : nil
    end

    all_answered = groups.reduce { |acc, i| acc & i }
    all_answered.size
end

puts data
puts data.sum
