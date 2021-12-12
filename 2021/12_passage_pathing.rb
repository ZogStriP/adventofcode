N = Hash.new { |h, k| h[k] = [] }

DATA.each {
  a, b = _1.chomp.split ?-
  N[a] << b if b != "start"
  N[b] << a if a != "start"
}

N.transform_values! { |v| v.partition { _1[/[A-Z]/] }}

def explore(path, max)
  path[-1]["end"] ? 1 : N[path[-1]][0].sum { explore(path + [_1], max) || 0 } + N[path[-1]][1].sum { path.count(_1) < max && explore(path + [_1], path.include?(_1) ? 1 : max) || 0 }
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
