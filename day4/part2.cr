required = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]

valid_eye_colors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

valid_chars = ['#', 'a', 'b', 'c', 'd', 'e', 'f']

def valid_height?(v)
    is_cm = v.includes? "cm"
    is_in = v.includes? "in"

    if !is_cm && !is_in
        return false
    end

    if v.includes?("cm")
        return (150..193).includes?(v.gsub("cm", "").to_i)
    else
        return (59..76).includes?(v.gsub("in", "").to_i)
    end
end

count = 0
File.read("./input").split("\n\n").each do |passport|
    parsed = passport.gsub("\n", " ").rstrip
    valid = required.all? do |item|
        parsed.includes?(item)
    end
    
    if valid
        meets_criteria = parsed.split(" ").all? do |item|
            values = item.split(":")
            if values.size == 1
                puts "'#{parsed}'"
                puts item
                puts values
            end
            key = values[0]
            v = values[1]
            
            case key
            when "cid"
                true
            when "byr"
                (1920..2002).includes?(v.to_i)
            when "iyr"
                (2010..2020).includes?(v.to_i)
            when "eyr"
                (2020..2030).includes?(v.to_i)
            when "ecl"
                valid_eye_colors.includes?(v)
            when "hcl"
                /#[0-9a-f]{6}/.match(v) != nil
            when "pid"
                v.size == 9
            when "hgt"
                valid_height?(v)
            else
                false
            end
        
        end

        if meets_criteria
            count += 1
        end
    end
end

puts count