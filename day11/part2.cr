input = File.read_lines("./input").map { |i| i.chars }

def print_board(board)
    board.each do |line|
        line.each do |char|
            print char
        end
        puts
    end
end

def get(map, x, y)
    if y >= 0 && y < map.size && x >= 0 && x < map[y].size
        return map[y][x]
    end
end

def check_vector(map, x, y, dx, dy)
    cx, cy = x + dx, y + dy
    while cy >= 0 && cy < map.size && cx >= 0 && cx < map[y].size
        spot = get(map, cx, cy)
        if spot == '#'
            return '#'
        elsif spot == 'L'
            return 'L'
        end

        cx += dx
        cy += dy
    end

    return '.'
end

def get_adjacent(map, x, y)
    adjacent = [] of Char?
    adjacent.push(check_vector(map, x, y, 0, -1))
    adjacent.push(check_vector(map, x, y, 0, 1))
    adjacent.push(check_vector(map, x, y, -1, 0))
    adjacent.push(check_vector(map, x, y, 1, 0))
    adjacent.push(check_vector(map, x, y, -1, 1))
    adjacent.push(check_vector(map, x, y, -1, -1))
    adjacent.push(check_vector(map, x, y, 1, -1))
    adjacent.push(check_vector(map, x, y, 1, 1))
    return adjacent
end

initial_state = input.map do |line|
    line.map do |char|
        char == 'L' ? '#' : '.'
    end
end

def next_char(current_char, surrounding)
    return '.' if  current_char == '.'

    count = surrounding.count { |x| x == '#' }
    if count == 0 && current_char == 'L'
        return '#'
    elsif count >= 5 && current_char == '#'
        return 'L'
    else
        return current_char
    end
end

def calculate_new_state(map)
    map.map_with_index do |line, y|
        line.map_with_index do |c, x|
            next_char(c, get_adjacent(map, x, y))
        end
    end
end

def changed?(previous, n)
    previous_repr = previous.to_s
    next_repr = n.to_s

    return previous_repr != next_repr
end

puts "Initial:"
print_board(initial_state)

puts "First Iteration:"
next_state = calculate_new_state(initial_state)
print_board(next_state)
loop do
    new_state = calculate_new_state(next_state)
    puts
    print_board(new_state)
    if changed?(next_state, new_state)
        next_state = new_state
    else
        break
    end
end



x = next_state.map { |line| line.count { |c| c == '#'}}
puts x.sum
