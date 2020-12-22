required = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
count = 0
File.read("./input").split("\n\n").each do |passport|
    valid = required.all? do |item|
        passport.includes?(item)
    end
    
    if valid
        count += 1
    end
end

puts count