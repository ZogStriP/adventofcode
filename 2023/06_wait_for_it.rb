times, distances = DATA.map { _1.split[1..].map &:to_i }

p times.size.times.map { |i| (1...times[i]).count { _1 * (times[i] - _1) > distances[i] } }.reduce :*

time, distance = [times, distances].map { _1.join.to_i }

p (1..time).count { _1 * (time - _1) > distance }

__END__
Time:        56     71     79     99
Distance:   334   1135   1350   2430