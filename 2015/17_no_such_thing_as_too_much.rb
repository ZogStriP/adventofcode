C = DATA.map &:to_i
W = [0] * C.size

(1...C.size).each { |n|
  C.combination(n).each { |c|
    W[c.size] += 1 if c.sum == 150
  }
}

p W.sum, W.find{_1>0}

__END__
33
14
18
20
45
35
16
35
1
13
18
13
50
44
48
6
24
41
30
42
