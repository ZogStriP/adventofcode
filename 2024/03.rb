c = $<.read
p c.scan(/mul\((\d+),(\d+)\)/).sum { _1.to_i * _2.to_i }
p c.scan(/(d)o\(\)|(d)on't\(\)|mul\((\d+),(\d+)\)/).sum { _1.._2 ? _3.to_i * _4.to_i : 0 }
