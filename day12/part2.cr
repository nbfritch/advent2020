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

direction_distances = {
    Direction::North => 0,
    Direction::South => 0,
    Direction::East => 0,
    Direction::West => 0
}

current_waypoint = {
    Direction::North => 1,
    Direction::South => 0,
    Direction::East => 10,
    Direction::West => 0
}

def rotate_waypoint(current_waypoint, rotation_direction, rotation_amount)
    rotate_count = (rotation_amount / 90).to_i

    new_waypoint = Hash(Direction, Int32).new

    if rotation_direction == Direction::Left
        rotate_count.times do
            new_waypoint[Direction::North],
            new_waypoint[Direction::East],
            new_waypoint[Direction::South],
            new_waypoint[Direction::West] = 
            current_waypoint[Direction::West],
            current_waypoint[Direction::South],
            current_waypoint[Direction::East],
            current_waypoint[Direction::North]
        end
    else
        rotate_count.times do
            new_waypoint[Direction::North],
            new_waypoint[Direction::East],
            new_waypoint[Direction::South],
            new_waypoint[Direction::West] = 
            current_waypoint[Direction::East],
            current_waypoint[Direction::South],
            current_waypoint[Direction::West],
            current_waypoint[Direction::North]
        end
    end

    return new_waypoint
end

def modify_waypoint(waypoint, direction, distance)
    case direction
    when .north?
    end
end


directions.each do |directive|
    direction, distance = directive
    case direction
    when .forward?
        current_waypoint.each_key do |dir|
            direction_distances[dir] += distance * current_waypoint[dir]
        end
    when .left?
        curreent_waypoint = rotate_waypoint(current_waypoint, Direction::Left, distance)
    when .right?
        current_waypoint = rotate_waypoint(current_waypoint, Direction::Right, distance)
    else
        current_waypoint[direction] += distance
    end
end

puts direction_distances
n_s = direction_distances[Direction::North] - direction_distances[Direction::South]
e_w = direction_distances[Direction::East] - direction_distances[Direction::West]
puts "Manhattan Distance = #{n_s.abs + e_w.abs}"

 