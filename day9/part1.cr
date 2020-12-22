inputs = File.read_lines("./input").map { |i| i.to_i64 }

def is_sum_of(values : Array(Int64), test_value)
    values.sort.each_combination(2) do |c|
        if c[0] + c[1] == test_value
            return true
        end
    end

    return false
end

inputs.each_index do |idx|
    comparisons = inputs[idx..idx+24]
    test_value = inputs[idx+25]
    if !is_sum_of(inputs, test_value)
        puts "#{test_value} BROKE THE RULE!!!!"
        exit(0)
    end
end
