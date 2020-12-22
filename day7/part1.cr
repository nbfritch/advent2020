verb_token = " bags contain "
noun_clause_token = ", "
null_noun_clause = "no other bags"
end_rule_token = "."

struct GraphConnection
    property count
    property color

    def initialize(@count : Int32, @color : String)
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
            clause_amount = clause.split(" ").first.to_i
            clause_noun = clause.gsub("#{clause_amount} ", "").gsub(" bags", "").gsub(" bag", "")

            GraphConnection.new(clause_amount, clause_noun)
        end
    end

    parsed_rules[subject] = parsed_clauses
end

def can_traverse_to_gold?(key, tree) : Bool
    return false unless tree.has_key?(key) 

    attached_colors = tree[key].map { |gc| gc.color }

    if attached_colors.includes?("shiny gold")
        return true
    else
        return attached_colors.any? do |color|
            can_traverse_to_gold?(color, tree)
        end
    end
end

count = 0
parsed_rules.each_key do |key|
    puts "#{key} : #{parsed_rules[key].map { |k| k.color }}"
    if can_traverse_to_gold?(key, parsed_rules)
        puts "#{key} : #{parsed_rules[key].map { |k| k.color }}"
        count += 1
    end
end

puts count