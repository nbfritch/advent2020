unsorted_inputs = File.read_lines("./input").map { |i| i.to_i64 }
inputs = unsorted_inputs.sort + [unsorted_inputs.max + 3]

class Counter
    @@cache = Hash(Int64, Int64).new

    def self.find_combinations(cend : Int64, availible : Array(Int64), highest : Int64) : Int64
        if cend == highest
            return 1.to_i64
        end

        count : Int64 = 0

        (1..3).each do |i|
            if availible.includes?(cend + i)
                remaining = availible.select { |a| a > (cend + i) }
                if !@@cache.has_key?(cend + i)
                    @@cache[cend + i] = Counter.find_combinations(cend + i, remaining, highest)
                end
                count += @@cache[cend + i]
            end
        end

        return count
    end
end

start : Int64 = 0
puts Counter.find_combinations(start, inputs, inputs.max)
