distances = Hash.new { |h, k| h[k] = Hash.new(0) }

DATA.each {
  a, b, d = _1.scan(/(.+) to (.+) = (.+)/)[0]
  distances[a][b] = distances[b][a] = d.to_i
}

min = 1.0 / 0
max = 0

distances.keys.permutation.each { |path|
  d = path.each_cons(2).sum { distances[_1][_2] }
  min = [min, d].min
  max = [max, d].max
}

p min, max

__END__
Faerun to Norrath = 129
Faerun to Tristram = 58
Faerun to AlphaCentauri = 13
Faerun to Arbre = 24
Faerun to Snowdin = 60
Faerun to Tambi = 71
Faerun to Straylight = 67
Norrath to Tristram = 142
Norrath to AlphaCentauri = 15
Norrath to Arbre = 135
Norrath to Snowdin = 75
Norrath to Tambi = 82
Norrath to Straylight = 54
Tristram to AlphaCentauri = 118
Tristram to Arbre = 122
Tristram to Snowdin = 103
Tristram to Tambi = 49
Tristram to Straylight = 97
AlphaCentauri to Arbre = 116
AlphaCentauri to Snowdin = 12
AlphaCentauri to Tambi = 18
AlphaCentauri to Straylight = 91
Arbre to Snowdin = 129
Arbre to Tambi = 53
Arbre to Straylight = 40
Snowdin to Tambi = 15
Snowdin to Straylight = 99
Tambi to Straylight = 70
