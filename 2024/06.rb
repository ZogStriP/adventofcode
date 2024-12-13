M = $<.map &:chop
Y, X = 0...M.size, 0...M[0].size

sy = sx = 0
Y.map { |y| X.map { |x| (sy = y; sx = x) if M[y][x][?^] } }

y, x, dy, dx, s = sy, sx, -1, 0, Set.new

while Y === y && X === x
  s << [y, x]
  dy, dx = dx, -dy while M[y + dy] && M[y + dy][x + dx] == ?#
  y += dy; x += dx
end

p s.size

l = []

s.each { |yy, xx|
  y, x, dy, dx, v = sy, sx, -1, 0, Set.new

  loop {
    break l << [y, x] if !v.add?([y, x, dy, dx])
    ny, nx = y + dy, x + dx
    break if !(Y === ny && X === nx)
    if M[ny][nx][?#] || (ny == yy && nx == xx)
      dy, dx = dx, -dy
    else
      y, x = ny, nx
    end
  }
}

p (l - [[sy, sx]]).size
