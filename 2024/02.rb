l = $<.map { _1.split.map &:to_i }
def diff(l) = l.each_cons(2).map { _1 - _2 }
def safe(l) = diff(l).all? { (1..3) === _1 } || diff(l).all? { (-3..-1) === _1 }
p l.count { safe _1 }
p l.count { |l| l.size.times.any? { safe l[..._1] + l[_1 + 1..] } }
