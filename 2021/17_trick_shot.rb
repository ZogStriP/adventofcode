xmin, xmax, ymin, ymax = DATA.read.scan(/-?\d+/).map &:to_i

X = (xmin..xmax)
Y = (ymin..ymax)

yys = -> dy {
  y, v = 0, []

  0.step { |s|
    v << s if Y === y
    y += dy; dy -= 1
    return v if y < ymin
  }
}

xxs = -> s {
  v = []

  (1..xmax).each { |xx|
    x, dx = 0, xx
    s.times { x += dx; dx -= 1 if dx > 0 }
    v << xx if X === x
  }

  v
}

p (1..(-ymin).downto(1).find { |dy| yys[dy].any? { xxs[_1].size > 0 }}).sum
p (ymin..-ymin).sum { |dy| yys[dy].flat_map { xxs[_1] }.uniq.size }

__END__
target area: x=195..238, y=-93..-67
