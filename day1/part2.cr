data = File.read_lines("./input").map do |line| line.to_i end

data.each do |first|
    data.each do |second|
        data.each do |third|
            if (first + second + third) == 2020
                puts "#{first} #{second} #{third}"
                exit(0)
            end
        end
    end
end
