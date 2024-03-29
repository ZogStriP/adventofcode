map = DATA.map { _1.chomp.chars.map &{ ?O => 0, ?# => 1 } }

def load(m) = m.sum { _1.each_with_index.sum { |c, i| c == 0 ? i + 1 : 0 } }
def rotate(m) = m.reverse.transpose

def tilt(m)
  n = Array.new(m.size) { [nil] * m[0].size }
  m.each_with_index { |row, r|
    (b = row.size).downto(0) { |c|
      case row[c]
      when 1; n[r][b  = c] = 1
      when 0; n[r][b -= 1] = 0
      end
    }
  }
  n
end

p load tilt rotate map

seen = []

4.times { map = tilt rotate map } until offset = (seen << map)[...-1].index(map)

p load rotate seen[offset + (1_000_000_000 - offset) % (seen.size - 1 - offset)]

__END__
..O...............O....O..O#.OO...O.O#...OO##O....#....O#.O#O....O#.......#.#OOO...O.......O##..#...
OO##.O..#..O..#.#........OO.....#...O.#.O..O...O..O.O...O..O....OOO.........#.#O.O....#..OO..#.##.O.
.#.O......O#.##..O..#...#..##.O......O.O#......O.O.OO..#.##.#OO.O..O.O..O#...O.O#.#O..O.#....O.O....
..#....O.#....O..O.OO#....#..#.OO...O..##OO###.#O#..#.O...#...#.O....O..#O#.O#..OO.#..O...#....O.O..
..#OO.O..###.....#.OOO...O....#OO.#..O.#.O.#.#.#O......O.O.O....O#O.O.O##.O..O..O..#.#O.#.O..O.O...O
..O...O.O##...#...O...##...#..O..........O#.#.OOO#.#..#.O......OO##........OO..O#...#.OO.....O.....#
.#.OO#.#O...#.OO....O.....O.O..O...#...O....O..#......###O..O..O#.....#.O..#O..#..O......#...O.....#
##....#O.#OO..#.......OO.....#..##....#..O#OO.#...OO.....O....#.....O#....O...OO#..#...#...O#...#.O#
...#...OO.O...O#.O.......#O....#..O..#.#.O.#.OOO.#..OOO.O#........##....#.O.O...#O..O.#OO.#OOO.O....
OO#.....O..#.#O....O...#..O.O...O..O.O#.........#O#OO..O.O....OO..OO...O...O...O.O....O....#..#..#..
O.#.O.#.....#...#.#........O..OO..O#O#O#.....#.#....O#..O.O......O.......#.....O...O...O.OO.O.O#...#
...#...O.#.#....O.OOO...#.##......OO.O...O....#.O#O..O....#..#..##.O...O....#...O..O.O.O........#OOO
.#.#......##O.OO.OO##.O...#.......O.#OO.##.#...O..#O..O.OO..O.O.O.#.O.O..#..O..#..#....OO..#..#.....
...#OO#.O....#O..O#.O..#.#.....#...#..O..O#O...........#...OO#O..O..#O...O.#..###.O.#......#...OO.O.
..#O....O.O#.O.O#.#.#...O....O.....O....#O........#OO.O#O#...O#.OO.O.....O.##..O.#...#.#.O...O#..#.#
.#..O#O...#O#.O.....O..#.#......O..OO.O.....O.....O.#.#O#.#O.O#.O###............##...O.....O.O.....#
.....O...#O#.#....O......##.#..#.##...#..O.O.O##....O..#...#O.O.....O..O#..#..O#...##...#...#OOO..O.
....O......OO##..O#O..O.....O#.#...O.#.O.#....#.OO.#OOO..#.O.O##.....O.O...#.....#.O.O....#...#.....
...O....#O....OO..#...#.O.......O.O....#.O......O..#.##O.....O...#O..#O#O.O#....#O..OO##..OO#....O.#
.#...#..#....O.....O.#OO.O..#...##...O.......O......#.O.#O..#..O....O..#........#...O...O###..O.....
#..#.O....O.#OOO##O#.##.O.#.#.#..#..O......#...OO.#..O...#....#....O...OO.#.OO...#.#........O......#
.....#O.#..###..O..#.#.#..#..#..O....#..#......#...O..#O....O....O.....OO.O#.......O..#....#...#..##
.#..#........#.#O#O...#...........O#....#.O.....#....#.##...#.O.O##..#O.#..O...#...##.O.##.O....O..O
...#.O...O...O........#...O..#.O.#.O.#....#OO......OO#.O.O##...##..OO#.#O.O.#..O....O......#....##..
.....#O..#.#.....#O#.#.#..#..O.........O.O.#...O...#OO#.....#.....O.O.#..##...OO...O...#OO.#........
....#.#..#O...O..#.O...O.OO......#O#.O##O.#..O..##.#O.O....O...##O..O...#.O..#O...##...O..O.#O....OO
...O..#....OO..O#.......#...........#..O.....O#OO#.O..O.O..#O...OOO..##OO........#..O.O##OO#...#O...
.O.......O.......O..O...###...O.....O.O.O#.#...O.O#..#O..#.O..OO....#O.....##...O...#O.#....O..#OO.O
##O#.O...OO.O.##.O...#....#..O.....OO.O....O#.O#.O..#....OO#.....OO..##.#......O.OO..#..#....#O..#O.
....#...#O....OO.....OO.O#.#.....#...O#O...#...#..OO..O##.O...O.O.O..........O.#.O#O....#O#...O.....
.....O.OO#OOO..##....##.....O#.......O#..#.#..OO...O..O...##...O..O.O#....OOO..#.OO........O..##..O.
.O.......#........#.....O.O...O...O.O...O..O....O#.....#.OO..O..#.##.#..#...#.#...O.#..##.......O...
.....O#....O.O.#..O.........O.O....###..O..OOO.O#..#..........#......OOOO.#O...O...O.O.....O.OOO##OO
#..#...........#....#...#.O..#...#O#...#...##.#....#O#.O#O......O#.#.#...O.O.#.O.#...O.O...OO.#....#
.O..O##....#..O.O..##.O.#..#........#..#.O.##...O...O....O.#...O...##..O#OO.#.#..O....O..##O...OO.O#
...O..#......#.#.......OO....#.....#......O.O....##O..OO.OO.#....##.O..O...........#OO...OO.O.O.OOO.
.........#.OO..O.O#....#.#..O...#.....O.O..............#.....OOOO.#..O.O#O.O.O...#..O.O.OO....O..#.O
O.........O##...#.....#....#.O......O.O.O.O..#.O#...O.OO.#.O.O.#.....O.O..OO#.#.#.O.#...#.....#....#
.OO.O.#O..O..#..O.O#.O..#O.#.#.OO.#O#OO..O.........O....#....#.O.O#.O.O.#...#..O...#..#.........O..O
OO..O......O#..#O..O.O.O..O...#..OO#.OO....#.OO.#O..O.O..#......#O.#....#...#.OOO....O.O.OO....#....
.O..#O#.......O....OO.O....#OO.O...O..#.....O#.O.OO.#..O..O.O#.....###O....#.....O.#.......O.....OO.
.O..O.O.##.OO..#.#.O...#...#.#..OOO..O.....#.#O#..OO.OOOO.#......O..#....O.#.O.#....#.....O...#..OO.
.#.#...OO..O....O.....O..##.#.#O#...#.....#..O.#......O.O##..#......O##..O.O...#O.#.O...........#O..
.OOO#....#..#O##..#.....O.OO#..O..#.##....OO..OO....#.##.#...#...O#O.....O#.#.#.O......#O...#.....#.
....O##....#...###O.OO..#...#.O.OO#O..O.O..##......O....#....#..O###..#..#.....O.......#..O.O#......
O.O...........O.#...OO.O.......#.....O...##.#..#.O#..#...#.O##..#O.##...O.....O...OOO.O.O..#OOO....#
.O.O#O...O...#...............OO#......O........##OO.......O...#OO.O..O....O..###.O..O...O...O.#.....
.O.##OO.........OO.OO..O..OO.#..#.#......O..O#O.O..##..O..O.##.....O#O.O...OO...O###..O......#.O....
#.O...O.O.O..O#..O.O......O.#.....O.O...#.#O.O..O.......O....#.....O#OO..O..O.O...O##..O.......#....
OOO...##...#..#.OO#O..O#.O.....O........O#....#.#.....O#.OOOO...#OOO...OO..OOO...O#........O...#....
#....#....#.....#....O.O..O.O...##.#..O##.#O.#.O.##O.............###..#O#O.O#..#........#.#O#....#..
O.#.#.OO.....#.##....OO...##..OO.#.......#O...O#............#O#O#....O..#......#......O#.OOO.O##..O.
....O....O.#O...#OO#...#.O....#.OO.O...##.O.O.O....OO#O.#....O.....O..#..O.#.O##O##....#..#..#.O.O..
###....#..#...OOO##O.O.#..#..O#......O....#.#.#OO.O....O.OOO..#...#O.##.#......OO.....O..#.O...#OO..
.#...O...O....OO.....O..O#..O.O.O.#.....#OO#O....O...OO..#..O.O.O.#..#O......##.....#.....#O.O......
.OOO........O.#.#....#OO..#.O.O...#.....#OO......O.....#......#.##.O.OO.....#O.#O..O.O....#...O.##.#
#O.O#..#..#...O.O#...O##..#..OOO....OO.#....#.O#OO.#..OO#.#OOO##OO.....O.O.O.....O...###O..O#O....#.
###...O..O.OO.#...#.O.O#O.OO..##O.OO..#..O...#.......#.......#.....#..#.#..O..#.OO....O..O..OO...#O.
OO...#OO.#....#.O.O.O..O....#O..#..O.O.O.#.......O......O.O.O.....O...O.OO#OO.......O..#.......#O...
.#OO.......O..OO.#O.#OO...#OO..O..O.#...O.O....O....#O#..OOO.#........#.O.O...#...O#.O...O.#.#....O.
#OO##.O...O....##..#....O.#..#.....##..O....#O...#......#O#.O..O.##.....O.O...#O.#OO.###O..#..O#O..#
.#...#.....O#.#....O.OO##.O.O..O........O##....#.O#O#.....##...O..O#.#....O.#...##...#..#O....O....O
..O..O....#..#....#..#.#.#O#........O..#.....O.###.#O...O...O##..O.O..#.#.O..#...OO.O.OOO.......#...
..OO##O.O..OO.O..#.#...O..O.#..O#..O#...#...O.O....#..O...O.#..#.#...O..OO..........O...O.O......O..
..#..#.#..O#.........O.......#.....#..#.....O#..#O.....OO..#...O#O.O#....#..O#....O..#O....O...O....
O..O..O.....#..#...O...#O.....O.OO..O....O.O....##..O.#OOO..#.#.O.O#......#.OOO..O.O.....#..#.......
....#.O.O.#.#..O#.....#..O##O..#..#.#....##O.....O##.#....O........O##...##OO...O#.#.O..O#O..#..O...
...#O.....O..##.#....O.OO.O...##..O........O..O.#.#........OO..OO...OO##...#....#...OO#..#O.O.......
##O..#OO....O..O#.O.O.#.OO.#O#.......#....O...#........O...#..O..OO#..O.....#...O...#....#..........
...##OO.O...#..#O...OO...#.OO.....O.O...OO..O#.........O...O....O#O#.O.#...OO...##O.#.#.O....O#..#..
#.....#...O.O.O...O#..#...OO.OO...O..##.#.......#.##OO...........O...O...##..OO..O..#.....#.O...OO..
..O.O...O#.OO#......OO..O#....O.O...#O.#.........O...#OO....O.O.O.#O........#.##.......#....##...#..
#.#...OO..#O..O.....OO###OOO........O.O.O....O#O#O#.O.....O#O..##.##O...O###....####.O..#..##....##O
..#..O.#.O.#.#...O.......O....O...OOOO...#.OO#....#.......O..O.........#..O.O.........#.O..O..O.O..#
#..OO...##.O.#.#..#...O.........#O.#.......#O....#..#O.#...O.O..##OOOO..#.#..........O..O.O.####..#.
#...O..#....#O..O#O#O.......O..O..O...O...OO.OO.OO.O..#.#.#OO#.#OO.#O........O..O.O.....OO.#O.#..O.#
..O.#...........O..OO......#OOO#...O#O#O......#......OO..O......O#..#.OOOO...O........#..#.OOO...#O.
O.##...#OO....OOO...O....O.....OO...##....#...#O.O..#..O#O....O#....O....##......OOO.O..#...O#OOOO..
...O.....O.O.#.#...OOO#OOO.O.....O#OOO#.#O...O#OO.O...#...O......OO.....O...#.O.#..##....#..O...OOO.
.#...O.....#..O......O...#.....##..O#.#O..O....O..#....O......##..#OO..O.##..#O....O......#.O.#OOO.O
.#...O...OO.....#.O..#OOO#.O....O.O...........#...O.....OO.##.#......O.O....#.O.##O....##......O....
.OO.....#O.##.##...#....#....OO.O...#.......OOO#..OO..O.O......#....#O...###.O..#.##.#.#..O.#...O...
....O.....OO..O##.O...#O##.O.#.OO.OO.O........#O............#OO.O#O.#.O##.##...........#..O.#O.O.#OO
..O..O...#O....O#..O.O..O..OOO..O..#.#.OO..#O#.#...O....#.O.#...#....##.....##O...#O##..O#.....#O...
O#.....O...#..##OO..O#O........#.#...#O...O#......#O..##.#O...O.O....OO..O.OOOO...#O.O.O....#OO.O.#.
.OO.....##..#...#.#....O...O...O...O..OO....#O..##O...O.#.OO.O##....#..O.OO.....O..##.O#.....#O..O#.
O.....O.O..#...O..#.#.OO...O..O#.#O..#O.#.#.##..#.O.OO##..O...#.#.O...##.O....O...OO...O#O..O.O.##O#
.#.O........##..........#...O...#O..O..#..O....OO.OO.#..O.O##.#...#.O#.O...##.O#...#....O......#..O.
O#O.OOO..##OO.#........#O.#O...OO...#.OO.........O.#.........#..#.....O.O...#..O#O.OO..O..O....O#...
.O#..O#...#O...O.O..O#...O.#.O.O....##O....O....##OO....O..O.#O.O....##.#O.....OO..#O..O....#OO...#.
O..........O.O.........#O...#...#..##........O.#......O#..O#.......O...O...#O....#.##......O.#.#.O.O
....O...#OO..O.O.....OO.#.#O.#........#O.O...#..#.....O...O.....OO...#.OO..##.O.#......#...#.O#..#..
...O..#.#...#.#..#..#...OO.#........##..O.O..#....#..O...O......#..O.......##....O............O.#..#
..O#.O.###........#.#.#...#.O.#O#O.O.O..O.O#O.....#O.O.O...O##O.....OO.O..O..#......O....O..#O......
#..O...O....OO.O.......O.......#..#O.#...O.###.....OO..O..O..OO.O#..#O.#OO.O#.O.O.O.O..O#...###O....
#....##O..O.#...O...#O....O#O#........#..#........###...##..O...O...OO.#.OO#..##..OOO......O.O.#.O#.
...OO.O........O...O..OO...O.O#O...O#.O.#.........O.O.......O.#....O...O..#.OO#..OOO...O.#..OO....O.
#O.OO.OO.##.#O...O.......#O.#O....O.#..O.......OOO...O#...##O##.#.......OO#O.....OO.OO#.O#O#O#....#.
....OO#OO...#........OO#...#..O....#.O..O...O.O.OO......O.#OO....#..#...........O...##..O..O.O......
#...O.O..O.##.......O.......O....O.O..#..#O...O.....OOO.#.O.....##..O..#O.......#..O..O.O.....O#OO.O