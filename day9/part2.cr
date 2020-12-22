invalid = 1309761972

inputs = File.read_lines("./input").compact_map { |i| i.to_i64 > invalid ? nil : i.to_i64 }

min_comparison = 2

inputs.each_index do |idx|
    compare_amount = min_comparison
    comparison = inputs[idx..idx+compare_amount]
    while comparison.sum < invalid && compare_amount + idx < inputs.size
        compare_amount += 1
        comparison = inputs[idx..idx+compare_amount]
    end
    if comparison.sum == invalid
        puts "Found digits #{comparison}"
        puts "#{comparison.min}"
        puts "#{comparison.max}"
        puts "#{comparison.min + comparison.max}"
        exit(0)
    end
end
