M = $<.map &:chop
Y, X = 0...M.size, 0...M[0].size

N = {}
Y.map { |y|
  X.map { |x|
    (N[M[y][x]] ||= []) << y + x * 1i if M[y][x] != ?.
  }
}

A = Set.new
B = Set.new

N.each {
  _2.permutation(2).each { |a, b|
    0.step { |s|
      c = a - s * (b - a)
      Y === c.real && X === c.imag ? (A << c if s == 1; B << c) : break
    }
  }
}

p A.size, B.size
