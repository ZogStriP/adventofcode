M, S, T = {}, {}, {}

DATA.each {
  name, targets = _1.chomp.split(" -> ")
  type = name[0].to_sym
  name = name["broadcaster"] ? name : name[1..]

  M[name] = type
  T[name] = targets.split(", ")
  S[name] = type == :& ? {} : false
}

T.each { |src, targets|
  targets.each { M[_1] == :& && S[_1][src] = false }
}

rx_src = T.find { _2.include? "rx" }[0]
H = S[rx_src].keys.to_h { [_1, nil] }

P = { true => 0, false => 0 }

1.step { |pushes|
  q = [["button", false, "broadcaster"]]

  p P[true] * P[false] if pushes == 1000

  while c = q.shift
    src, pulse, dst = c

    P[pulse] += 1

    H[dst] ||= pushes if H.has_key?(dst) && !pulse
    (p H.values.reduce &:lcm; exit) if H.values.all?

    case M[dst]
    when :b
      T[dst].each { q << [dst, pulse, _1] }
    when :%
      next if pulse
      S[dst] = !S[dst]
      T[dst].each { q << [dst, S[dst], _1] }
    when :&
      S[dst][src] = pulse
      pulse = !S[dst].values.all?
      T[dst].each { q << [dst, pulse, _1] }
    end
  end
}

__END__
%cf -> tz
%kr -> xn, gq
%cp -> sq, bd
broadcaster -> vn, sj, tg, kn
%hc -> pm
%fd -> xn, mj
%qz -> xf
%vf -> mc, pm
%zm -> rz, pm
%cn -> bd, qz
%jj -> bp
%ks -> ff
%nb -> xn, ks
%bm -> pm, vf
&xn -> kc, jb, cb, tg, ks, tx
%lm -> rk
%dn -> bd, cn
%ft -> dn
%pn -> pm, ll
%rk -> bp, fs
%tz -> bp, gp
%mc -> jx
%fs -> kx
%jf -> bd, fm
%rz -> hc, pm
%tg -> cb, xn
&hf -> rx
%vp -> pn
&pm -> ll, mc, sj, vd, vp
%rn -> kc, xn
%vn -> bd, cp
&nd -> hf
%fm -> bd, gc
%ff -> xn, fd
&bp -> cf, fh, pc, kn, fs, gn, lm
&pc -> hf
%mj -> xn
%qg -> bd
%fh -> lm
%kc -> nb
%xf -> bd, jf
%gc -> qg, bd
&bd -> vn, sq, qz, ft, nd
%jb -> kr
%gp -> bp, rp
%gq -> xn, rn
%sj -> pm, bm
%rp -> bp, jj
%sq -> ft
%cb -> jb
&vd -> hf
%gn -> cf
%kx -> gn, bp
%ll -> zm
&tx -> hf
%jx -> md, pm
%md -> pm, vp
%kn -> fh, bp