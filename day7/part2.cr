verb_token = " bags contain "
noun_clause_token = ", "
null_noun_clause = "no other bags"
end_rule_token = "."

struct GraphConnection
    property count
    property color

    def initialize(@count : Int64, @color : String)
    end
end

rules = File.read_lines("./input")

parsed_rules = {} of String => Array(GraphConnection)
rules.each do |rule|
    sections = rule.split(verb_token)
    subject = sections.first
    noun_clauses = sections.last.gsub(end_rule_token, "").split(noun_clause_token)
    parsed_clauses = noun_clauses.compact_map do |clause|
        if clause == null_noun_clause
            nil
        else
            clause_amount = clause.split(" ").first.to_i64
            clause_noun = clause.gsub("#{clause_amount} ", "").gsub(" bags", "").gsub(" bag", "")

            GraphConnection.new(clause_amount, clause_noun)
        end
    end

    parsed_rules[subject] = parsed_clauses
end

def traverse(key, tree, number : Int64) : Int64
    puts "LOST KEY: #{key}" if !tree.has_key?(key)
    return number unless tree.has_key?(key)
    puts "#{key}, #{tree[key]}"

    all_connections = tree[key]

    return number if !all_connections.any?

    values = all_connections.map do |connection|
        count = connection.count
        color = connection.color

        number * traverse(color, tree, count)
    end

    puts "SUM: #{values.sum}"

    values.sum + number
end

puts traverse("shiny gold", parsed_rules, 1)