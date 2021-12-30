weights = DATA.map &:to_i

groups = 3 # 4 for part 2
sum = weights.sum / groups

quantum = -> w, g {
  (1..w.size).each { |s|
    w.combination(s).each { |c|
      if c.sum == sum
        return true if g == 2
        return quantum[w - c, g - 1] if g < groups
        return c.reduce(:*) if quantum[w - c, g - 1]
      end
    }
  }
}

p quantum[weights, groups]

__END__
1
2
3
7
11
13
17
19
23
31
37
41
43
47
53
59
61
67
71
73
79
83
89
97
101
103
107
109
113
