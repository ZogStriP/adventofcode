N = Hash.new { |h, k| h[k] = [] }

DATA.each {
  a, b = _1.chomp.split ?-
  N[a] << b unless b["start"]
  N[b] << a unless a["start"]
}

def explore(path, max)
  path[-1]["end"] ? 1 : N[path[-1]].sum { (_1[/[A-Z]/] || path.count(_1) < max) && explore(path + [_1], _1[/[a-z]/] && path.include?(_1) ? 1 : max) || 0 }
end

p explore(["start"], 1)
p explore(["start"], 2)

__END__
fw-ll
end-dy
tx-fw
tx-tr
dy-jb
ZD-dy
dy-BL
dy-tr
dy-KX
KX-start
KX-tx
fw-ZD
tr-end
fw-jb
fw-yi
ZD-nr
start-fw
tx-ll
ll-jb
yi-jb
yi-ll
yi-start
ZD-end
ZD-jb
tx-ZD
