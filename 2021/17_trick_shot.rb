X, Y = DATA.read.scan(/-?\d+\.\.-?\d+/).map { eval _1 }

fire = -> dx, dy {
    💥, x, y, ymax = false, 0, 0, 0

    loop {
      x += dx; dx -= 1 if dx > 0
      y += dy; dy -= 1
      ymax = [ymax, y].max
      break 💥 = true if X === x && Y === y
      break if y <= Y.min
    }

    [💥, ymax]
}

hits = [*(1..X.max)].product([*(Y.min..-Y.min)]).map { fire[_1, _2] }.filter &:first

p hits.map(&:last).max, hits.size

__END__
target area: x=195..238, y=-93..-67
