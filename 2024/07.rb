E = $<.map { _1.scan(/\d+/).map &:to_i }
def s(n, i = 1, acc = 0) = acc > n[0] || i == n.size ? acc == n[0] : s(n, i + 1, acc * n[i]) || s(n, i + 1, acc + n[i])
def t(n, i = 1, acc = 0) = acc > n[0] || i == n.size ? acc == n[0] : t(n, i + 1, acc * n[i]) || t(n, i + 1, acc + n[i]) || t(n, i + 1, "#{acc}#{n[i]}".to_i)
p E.sum { s(_1) ? _1[0] : 0 }
p E.sum { t(_1) ? _1[0] : 0 }
