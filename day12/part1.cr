enum Direction
    North
    South
    East
    West
    Left
    Right
    Forward
end

identifiers = {
    'N' => Direction::North,
    'S' => Direction::South,
    'E' => Direction::East,
    'W' => Direction::West,
    'L' => Direction::Left,
    'R' => Direction::Right,
    'F' => Direction::Forward 
}

directions = File.read_lines("./input").map do |direction|
    d = identifiers[direction[0]]
    value = direction[1..direction.size].to_i
    
    {d, value}
end

def next_direction(current_direction, rotation_direction, rotation_distance)
    right_lut = [Direction::North, Direction::East, Direction::South, Direction::West]
    left_lut = [Direction::North, Direction::West, Direction::South, Direction::East]
    start_at = case current_direction
    when .north?
        0
    when .east?
        rotation_direction == Direction::Left ? 3 : 1
    when .south?
        2
    when .west?
        rotation_direction == Direction::Left ? 1 : 3
    else
        0
    end

    turns = rotation_distance / 90
    next_direction = (turns + start_at) % 4
    next_index = next_direction.to_i

    return rotation_direction == Direction::Left ? left_lut[next_index] : right_lut[next_index]
end

current_direction = Direction::East
direction_distances = {
    Direction::North => 0,
    Direction::South => 0,
    Direction::East => 0,
    Direction::West => 0
}

directions.each do |directive|
    direction, distance = directive
    case direction
    when .forward?
        direction_distances[current_direction] += distance
    when .left?
        current_direction = next_direction(current_direction, Direction::Left, distance)
    when .right?
        current_direction = next_direction(current_direction, Direction::Right, distance)
    else
        direction_distances[direction] += distance
    end
end

puts direction_distances
n_s = direction_distances[Direction::North] - direction_distances[Direction::South]
e_w = direction_distances[Direction::East] - direction_distances[Direction::West]
puts "Manhattan Distance = #{n_s.abs + e_w.abs}"

