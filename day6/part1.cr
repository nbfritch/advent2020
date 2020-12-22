data = File.read("./input").split("\n\n").map do |group|
    group.gsub("\n", "").chars.to_set.size
end

puts data.sum