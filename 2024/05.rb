rules, pages = $<.read.split("\n\n").map &:split

R = {}
rules.map { a, b = _1.split ?|; (R[a] ||= []) << b }

y, n = pages
  .map { _1.split ?, }
  .partition { |p| (0...p.size).all? { (p[_1 + 1..] & R[p[_1]]).size == p.size - _1 - 1 } }

n.map! { _1.sort { |a, b| R[a].include?(b) ? -1 : R[b].include?(a) ? 1 : 0 } }

puts [y, n].map { |l| l.sum { _1[_1.size / 2].to_i } }
