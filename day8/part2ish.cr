enum OpCode
    Acc
    Jmp
    Nop
end

struct Instruction
    property opcode
    property value

    def initialize(@opcode : OpCode, @value : Int32)    
    end
end

raw_instructions = File.read_lines("./input2")

instructions = raw_instructions.map do |instruction|
    parts = instruction.split(" ")
    opcode = parts[0]
    value = parts[1]

    parsed_opcode = OpCode::Nop
    if opcode == "acc"
        parsed_opcode = OpCode::Acc
    end
    if opcode == "jmp"
        parsed_opcode = OpCode::Jmp
    end

    Instruction.new(parsed_opcode, value.to_i32)
end

program_counter = 0
accumulator = 0
visited_addresses = [] of Int32

def new_acc(current_acc : Int32, argument : Int32)
    return current_acc + argument
end

def new_pc(current_pc : Int32, argument : Int32)
    return current_pc + argument
end

debug = true

loop do
    if program_counter == instructions.size
        puts "Accumulator is #{accumulator}"
        exit(0)
    end

    to_execute = instructions[program_counter]
    puts "#{program_counter}: #{raw_instructions[program_counter]}" if debug

    visited_addresses.push(program_counter)

    new_accumulator = accumulator
    new_program_counter = program_counter
    case to_execute.opcode
    when .acc?
        new_accumulator = new_acc(accumulator, to_execute.value)
        new_program_counter = new_pc(program_counter, 1)
    when .jmp?
        new_program_counter = new_pc(program_counter, to_execute.value)
    else # nop
        new_program_counter = new_pc(program_counter, 1)
    end

    if visited_addresses.includes?(new_program_counter)
        puts "Next address #{new_program_counter} has been visited previously, Accumulator: #{accumulator}"
    end

    program_counter = new_program_counter
    accumulator = new_accumulator
end
