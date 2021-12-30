N = 29_000_000
MAX = N / 10

h = [10] * (MAX + 1)

(2..MAX).each { |a|
  a.step(MAX, a) { |b|
    h[b] += a * 10
  }
}

p h.index { _1 >= N }

h = [11] * (MAX + 1)

(2..MAX).each { |a|
  a.step(MAX, a).first(50).each { |b|
    h[b] += a * 11
  }
}

p h.index { _1 >= N }

