require "digest"

SECRET = "bgvyzdsv"

p (1..).find { Digest::MD5.hexdigest(SECRET + _1.to_s).start_with? "00000" }
p (1..).find { Digest::MD5.hexdigest(SECRET + _1.to_s).start_with? "000000" }

