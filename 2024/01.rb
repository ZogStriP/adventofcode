a, b = $<.map { _1.split.map &:to_i }.transpose.map &:sort
p a.zip(b).sum { (_1 - _2).abs }
p a.sum { _1 * b.count(_1) }
