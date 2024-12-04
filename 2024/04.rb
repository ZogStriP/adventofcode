M = *$<
Y, X = 0...M.size, 0...M[0].size
D = [*-1..1].product([*-1..1]) - [[0, 0]]

def m(y, x, dy, dx) = @t.all? { Y === y && M[y][x] == _1 && (y += dy; x += dx) } ? 1 : 0

@t = "XMAS".chars
p D.sum { |dy, dx| Y.sum { |y| X.sum { |x| m(y, x, dy, dx) } } }

@t = "MAS".chars
p Y.sum { |y| X.sum { |x| [-1, 1].sum { |dy| m(y - dy, x - dy, dy, dy) } * [-1, 1].sum { |dx| m(y - dx, x + dx, dx, -dx) } } }
