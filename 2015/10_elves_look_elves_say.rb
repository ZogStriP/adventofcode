sequence = "1113122113"

40.times { sequence.gsub!(/(.)\1*/) { "#{$&.size}#{$1}" } }
p sequence.size

10.times { sequence.gsub!(/(.)\1*/) { "#{$&.size}#{$1}" } }
p sequence.size
