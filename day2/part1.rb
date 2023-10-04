o = File.readlines("./input").map do |line|
  s = line.split(" ")
  r = s[0].split("-")
  r_lo = r[0].to_i
  r_hi = r[1].to_i
  c = s[1][0]
  p = s[2]
  o = p.count(c)
  o <= r_hi && o >= r_lo
end

puts o.filter { |x| x == true }.length