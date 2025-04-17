$b = 'bcdefghia';
eval($s='
t = {
  h: [1, 0],
  j: [0, -1],
  k: [0, 1],
  l: [-1, 0],
  i: [0, 0]
};
p = -> a, b {
  i = $b.index(?a);
  x = i % 3 + a;
  y = i / 3 + b;
  (x < 0 || 2 < x || y < 0 || 2 < y) ||
    ($b[j = y * 3 + x], $b[i] = $b[i], $b[j])
};
i = (o = :"#{$*[0]}") == :i;
while (o != :q);
  if (q = t[o]);
    p[*q];
  else;
    (o = o.to_s.to_i) > 0 && (
      srand(o);
      a = b = n = 45;
      (p[*(a, b = (t.values - [[-a, -b], [0, 0]]).sample)] && n -= 1) while (n > 0);
    );
  end;
  print("$b=\47#$b\47;eval($s=\47");
  n = "1111141424414143341142414424344111143434".scan(/.{,5}/);
  m = "000001100101111".scan(/.{,3}/);
  s = 0;
  b = -> _ = 1 {_.times{print($s[(s += 1) - 1])}};
  w = -> _ = 13 {print "\40" * _};
  b[22];
  puts;
  3.times {|y|
    b[45];
    puts;
    b[2];
    w[];
    b[];
    w[];
    b[];
    w[];
    b[2];
    puts;
    10.times {|l|
      b[2];
      3.times {|x|
        w[2];
        $b[y * 3 + x] == ?a ? (
          (l == 3 && !print("\40\40\124\122\111\103\113\40\40")) ||
          (l == 5 && !print("\105\120\111\123\117\104\105\40\111")) ||
          w[9]
        ) :
          m[n[$b[y * 3 + x].ord - 98][l / 2].to_i].chars{(_1 == ?1 ? b : w)[3]};
        w[2];
        b[x / 2 + 1]
      };
      puts
    };
    b[2];
    w[];
    b[];
    w[];
    b[];
    w[];
    b[2];
    puts;
    b[45];
    puts
  };
  b[9];
  puts("\47.gsub(/[[:space:][:upper:]]/,%%%));");
  i ||
    break;
  print("\12enter\40[hjkl]\40or\40[q]uit\40>\40");
  o = :"#{$stdin.gets.chomp}";
  puts;
end'.gsub(/[[:space:][:upper:]]/,%%%));
