map = DATA.map { _1.chop.bytes }
Y = map.size
X = map[0].size
map.flatten!

goal = nil
start = nil
starts = []

Y.times { |y|
  X.times { |x|
    case map[c = y * X + x].chr
    when ?a; starts << c
    when ?S; starts << (start = c); map[c] = ?a.ord
    when ?E; goal = c; map[c] = ?z.ord
    end
  }
}

steps = -> (s) {
  q = [s]
  d = Array.new(map.size, map.size + 1)
  d[s] = 0

  while c = q.shift
    break if c == goal

    y, x = c.divmod(X)

    [
      (c - X if y > 0),
      (c - 1 if x > 0),
      (c + 1 if x + 1 < X),
      (c + X if y + 1 < Y),
    ].each { _1 && map[_1] <= map[c] + 1 && d[_1] > d[c] + 1 && (d[_1] = d[c] + 1; q << _1) }
  end

  d[goal]
}

p steps[start], starts.map { steps[_1] }.min

__END__
abccccccccccccccccccaaaaaaaaacccccccccccccccccccccccccccccccccccccaaaa
abcccccccccccccccaaaaaaaaaaacccccccccccccccccccccccccccccccccccccaaaaa
abcaaccaacccccccccaaaaaaaaaacccccccccccccccccccccaaacccccccccccccaaaaa
abcaaaaaaccccccccaaaaaaaaaaaaacccccccccccccccccccaacccccccccccccaaaaaa
abcaaaaaacccaaacccccaaaaaaaaaaaccccccccccccccccccaaaccccccccccccccccaa
abaaaaaaacccaaaaccccaaaaaacaaaacccccccccccaaaacjjjacccccccccccccccccca
abaaaaaaaaccaaaaccccaaaaaaccccccaccccccccccaajjjjjkkcccccccccccccccccc
abaaaaaaaaccaaacccccccaaaccccccaaccccccccccajjjjjjkkkaaacccaaaccaccccc
abccaaacccccccccccccccaaccccaaaaaaaacccccccjjjjoookkkkaacccaaaaaaccccc
abcccaacccccccccccccccccccccaaaaaaaaccccccjjjjoooookkkkcccccaaaaaccccc
abcccccccaacccccccccccccccccccaaaacccccccijjjoooooookkkkccaaaaaaaccccc
abccaaccaaaccccccccccccccccccaaaaacccccciijjooouuuoppkkkkkaaaaaaaacccc
abccaaaaaaaccccccccccaaaaacccaacaaaccciiiiiooouuuuupppkkklllaaaaaacccc
abccaaaaaacccccccccccaaaaacccacccaaciiiiiiqooouuuuuupppkllllllacaccccc
abcccaaaaaaaacccccccaaaaaaccccaacaiiiiiqqqqoouuuxuuupppppplllllccccccc
abccaaaaaaaaaccaaaccaaaaaaccccaaaaiiiiqqqqqqttuxxxuuuppppppplllccccccc
abccaaaaaaaacccaaaaaaaaaaacccaaaahiiiqqqttttttuxxxxuuuvvpppplllccccccc
abcaaaaaaacccaaaaaaaaaaacccccaaaahhhqqqqtttttttxxxxuuvvvvvqqlllccccccc
abcccccaaaccaaaaaaaaaccccccccacaahhhqqqttttxxxxxxxyyyyyvvvqqlllccccccc
abcccccaaaccaaaaaaaacccccccccccaahhhqqqtttxxxxxxxyyyyyyvvqqqlllccccccc
SbcccccccccccaaaaaaaaaccccccccccchhhqqqtttxxxxEzzzyyyyvvvqqqmmlccccccc
abcccccccccccaaaaaaaacccaacccccccchhhppptttxxxxyyyyyvvvvqqqmmmcccccccc
abccccccccccaaaaaaaaaaccaacccccccchhhpppptttsxxyyyyyvvvqqqmmmccccccccc
abcaacccccccaaaaaaacaaaaaaccccccccchhhppppsswwyyyyyyyvvqqmmmmccccccccc
abaaaacccccccaccaaaccaaaaaaacccccccchhhpppsswwyywwyyyvvqqmmmddcccccccc
abaaaaccccccccccaaaccaaaaaaacccccccchhhpppsswwwwwwwwwvvqqqmmdddccccccc
abaaaacccccccccaaaccaaaaaaccccccccccgggpppsswwwwrrwwwwvrqqmmdddccccccc
abccccccaaaaaccaaaacaaaaaaccccccaacccggpppssswwsrrrwwwvrrqmmdddacccccc
abccccccaaaaaccaaaacccccaaccccaaaaaacggpppssssssrrrrrrrrrnmmdddaaccccc
abcccccaaaaaaccaaaccccccccccccaaaaaacggppossssssoorrrrrrrnnmdddacccccc
abcccccaaaaaaccccccccaaaaccccccaaaaacgggoooossoooonnnrrnnnnmddaaaacccc
abccccccaaaaaccccccccaaaacccccaaaaaccgggoooooooooonnnnnnnnndddaaaacccc
abccccccaaaccccccccccaaaacccccaaaaacccgggoooooooffennnnnnnedddaaaacccc
abcccccccccccccccccccaaacccccccaacccccggggffffffffeeeeeeeeeedaaacccccc
abccccccccccccccccccaaacccccaccaaccccccggfffffffffeeeeeeeeeecaaacccccc
abccccccccccccccccccaaaacccaaaaaaaaaccccfffffffaaaaaeeeeeecccccccccccc
abccccccccaacaaccccaaaaaacaaaaaaaaaaccccccccccaaaccaaaaccccccccccccccc
abccccccccaaaaacccaaaaaaaaaaacaaaaccccccccccccaaaccccaaccccccccccaaaca
abcccccccaaaaaccccaaaaaaaaaaacaaaaacccccccccccaaaccccccccccccccccaaaaa
abcccccccaaaaaacccaaaaaaaaaacaaaaaacccccccccccaaccccccccccccccccccaaaa
abcccccccccaaaaccaaaaaaaaaaaaaaccaaccccccccccccccccccccccccccccccaaaaa
