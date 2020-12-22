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

raw_instructions = File.read_lines("./input")

instructions : Array(Instruction) = raw_instructions.map do |instruction|
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

def new_acc(current_acc : Int32, argument : Int32)
    return current_acc + argument
end

def new_pc(current_pc : Int32, argument : Int32)
    return current_pc + argument
end

def pretend_execute(instruction : Instruction, instructions : Array(Instruction), acc_in : Int32, pc_in : Int32, debug = false)
    puts "Pretending from #{pc_in}"
    program_counter = pc_in
    accumulator = acc_in
    local_addresses = [] of Int32

    loop do
        first : Instruction = instructions[program_counter]
        to_execute = program_counter == pc_in ? instruction : first
        #puts "(Pretend) #{program_counter}: #{raw_instructions[program_counter]}" if debug
    
        local_addresses.push(program_counter)
    
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

        if new_program_counter == instructions.size
            puts "Found program_counter #{pc_in} as needing changed"
            exit(0)
            return true
        end
    
        if local_addresses.includes?(new_program_counter)
            puts "Next address #{new_program_counter} has been visited previously"
            return false
        end
    
        program_counter = new_program_counter
        accumulator = new_accumulator
    end

    return false
end

debug = true

run_to_completion = false
program_counter = 0
accumulator = 0
visited_addresses = [] of Int32

loop do
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
        if !run_to_completion
            run_to_completion = pretend_execute(Instruction.new(OpCode::Nop, to_execute.value), instructions, accumulator, program_counter, debug)
        end
        
        new_program_counter = new_pc(program_counter, to_execute.value)
    else # nop
        if !run_to_completion
            run_to_completion = pretend_execute(Instruction.new(OpCode::Jmp, to_execute.value), instructions, accumulator, program_counter, debug)
        end

        new_program_counter = new_pc(program_counter, 1)
    end

    if visited_addresses.includes?(new_program_counter)
        puts "Next address #{new_program_counter} has been visited previously"
        
    end

    program_counter = new_program_counter
    accumulator = new_accumulator
end
