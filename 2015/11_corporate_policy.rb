ABC = Regexp.union (?a..?z).each_cons(3).map(&:join)

password = "cqjxjnds"
password.succ! until password[ABC] && !password[/[iol]/] && password.scan(/(.)\1/).uniq.size > 1
puts password

password.succ!
password.succ! until password[ABC] && !password[/[iol]/] && password.scan(/(.)\1/).uniq.size > 1
puts password
