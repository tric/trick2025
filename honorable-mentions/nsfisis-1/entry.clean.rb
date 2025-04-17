# A long time ago in a galaxy far,
# far away....







eval(%w{

def'false(p,s=[],v={});
  c=0;
  while(c<p.size);
    if(!(i=p[c]));false;
    elsif"$"==i;s.push(s.last);
    elsif"%"==i;s.pop;
    elsif(28.chr)==i;s.push(s.pop,s.pop);
    elsif"@"==i;s[-3],s[-2],s[-1]=s[-2],s[-1],s[-3];
    elsif"+"==i;s.push(s.pop+s.pop);
    elsif"-"==i;s.push(-s.pop+s.pop);
    elsif"*"==i;s.push(s.pop*s.pop);
    elsif"/"==i;s.push(s.pop.then{s.pop/_1});
    elsif"_"==i;s.push(-s.pop);
    elsif"&"==i;s.push(s.pop&s.pop);
    elsif"|"==i;s.push(s.pop|s.pop);
    elsif"~"==i;s.push(~s.pop);
    elsif">"==i;s.push((s.pop<s.pop)?~0:0);
    elsif"="==i;s.push((s.pop==s.pop)?~0:0);
    elsif"!"==i;self.false(s.pop,s,v);
    elsif"?"==i;s.pop.then{s.pop!=0&&self.false(_1,s,v)};
    elsif":"==i;v[s.pop]=s.pop;
    elsif";"==i;s.push(v[s.pop]);
    elsif","==i;print(s.pop.chr);
    elsif"."==i;print(s.pop);
    elsif/[0-9]/=~i;s.push(i.to_i);
    elsif/[a-z]/=~i;s.push(i);
    elsif"["==i;
      q=c+=(b=1);
      while(b!=0);
        b+={"["=>1,"]"=>-1}[p[c]]||0;
        c+=1;
      end;
      s.push(p[q...(c-=1)]);
    elsif"#"==i;
      a,b=s.pop,s.pop;
      loop{;
        self.false(b,s,v);
        s.pop!=0&&break;
        self.false(a,s,v);
      };
    end;
    c+=1;
  end;
end;


class'String;
  def&(other);
    (self[1..]+other[1..])
      .chars
      .map{(_1.upcase==_1)??1:?0}
      .join
      .to_i(2)
      .chr;
  end;

  def|(other);
    (self||"")+(other||"");
  end;

  def'method_missing(_);
    self;
  end;
end;


def'Object.const_missing(n);
  const_set(n,n.to_s);
end;

}.join.gsub("'"," "))




     EPISODE_VII

  THE_FALSE_AWAKENS




self.false((
  May.the.false.be.with.you;
  TrUE&FaLsE|TrUe&FaLse|TrUe&FAlSe|TrUE&FalSE|TrUe&FAlSe|TrUe&FaLse|TrUe&FaLse|TrUe&FaLse|TrUe&FaLse|TrUE&FAlsE|TrUe&FAlSE|TrUe&FALse|
  TrUE&FaLSE|TrUe&FAlSE|TrUe&FALse|TrUE&FalSe|TrUe&FALsE|TrUe&FALse|TrUE&FAlse|TrUe&FALsE|TrUe&FALse|TrUe&FALse|TrUE&FaLse|TrUE&FAlse|
  TrUe&FAlSe|TrUe&FALse|TrUE&FaLsE|TrUE&FalSe|TrUE&False|TrUE&FalSe|TrUe&FALSe|TrUe&FALSe|TrUe&FALSe|TrUe&FALSe|TrUE&FalSe|TrUE&FaLsE|
  TrUe&FAlSe|TrUe&FALse|false
))
