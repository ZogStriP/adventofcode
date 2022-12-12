monkeys = []
operations = []
throws = []
inspections = []

n = 1

DATA.read.split("\n\n").each { |monkey|
  _, s, o, t, a, b = monkey.lines
  t = t[/(\d+)/, 1].to_i
  a = a[/(\d+)/, 1].to_i
  b = b[/(\d+)/, 1].to_i
  n *= t
  monkeys << s.scan(/\d+/).map(&:to_i)
  operations << eval("-> (old) { #{o[o.index(?=) + 1..]} }")
  throws << -> (n) { n % t == 0 ? a : b }
  inspections << 0
}

round = -> (&worry) {
  monkeys.size.times.each { |m|
    while item = monkeys[m].shift
      w = worry.call operations[m][item]
      monkeys[throws[m][w]] << w
      inspections[m] += 1
    end
  }
}

#20.times { round[] { _1 / 3 } }
#p inspections.max(2).reduce :*

10000.times { round[] { _1 % n } }
p inspections.max(2).reduce :*

__END__
Monkey 0:
  Starting items: 50, 70, 54, 83, 52, 78
  Operation: new = old * 3
  Test: divisible by 11
    If true: throw to monkey 2
    If false: throw to monkey 7

Monkey 1:
  Starting items: 71, 52, 58, 60, 71
  Operation: new = old * old
  Test: divisible by 7
    If true: throw to monkey 0
    If false: throw to monkey 2

Monkey 2:
  Starting items: 66, 56, 56, 94, 60, 86, 73
  Operation: new = old + 1
  Test: divisible by 3
    If true: throw to monkey 7
    If false: throw to monkey 5

Monkey 3:
  Starting items: 83, 99
  Operation: new = old + 8
  Test: divisible by 5
    If true: throw to monkey 6
    If false: throw to monkey 4

Monkey 4:
  Starting items: 98, 98, 79
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 1
    If false: throw to monkey 0

Monkey 5:
  Starting items: 76
  Operation: new = old + 4
  Test: divisible by 13
    If true: throw to monkey 6
    If false: throw to monkey 3

Monkey 6:
  Starting items: 52, 51, 84, 54
  Operation: new = old * 17
  Test: divisible by 19
    If true: throw to monkey 4
    If false: throw to monkey 1

Monkey 7:
  Starting items: 82, 86, 91, 79, 94, 92, 59, 94
  Operation: new = old + 7
  Test: divisible by 2
    If true: throw to monkey 5
    If false: throw to monkey 3
