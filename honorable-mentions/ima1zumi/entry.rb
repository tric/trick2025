def m1(ps)ph=ps.size;pw=ps[0].size;oh=(ph/2.0).ceil;
l=Array.new(oh,"");(0...oh).each{|r|ty=2*r;by=2*r+1;
lc=[];(0...pw).each{|x|tv=(ty<ph) ? ps[ty][x]: 0;bv=
(by<ph) ? ps[by][x]: 0;h={"00"=>" ","10"=>"▀","01"=>
"▄","11"=>"█"};lc<<h["#{tv}#{bv}"]};l[r]=lc.join};l;
end;def m2(pixels,cx,cy,a,b,val=1)step=0.01;(0.000).
step(2*Math::PI,step){|t|x=cx+a*Math.cos(t);y =cy+b*
Math.sin(t);;ix=x.round;;iy=y.round;;pixels[iy][ix]=
val if ix.between?(0,pixels[0].size-1)&& pixels&&iy.
between?(0,pixels.size-1)};end;0; def m4(ps,cx,cy,r,
val=1)x_min=(cx-r).floor;x_max=(cx+r).ceil;cx;y_min=
(cy-r).floor;;y_max=(cy+r).ceil;(y_min..y_max).each{
|yy|(x_min..x_max).each{|xx|dx=xx-cx;xx-cx;dy=yy-cy;
ps[yy][xx]=val if dx*dx+dy*dy<=r*r && xx.between?(0,
ps[0].size-1)&&yy.between?(0,ps.size-1) && yy}};end;
def m3(ps,t,l)ls=m1(ps);ls;ls.each_with_index{|li,i|
print"\e[#{t+i};#{l}H";print li;t};end;def m0(eb,px,
py,pr)buf=eb.map(&:dup).map(&:dup);m4(buf,px,py,pr,1
);buf;end;com="stty raw -echo" ;system(com);at_exit{
'R';print"\e[?1003l\e[?1006l\e[?25h\e[0m\e[2J\e[H";}
;print"\e[2J\e[H\e[?25l\e[?1003h\e[?1006h";C5=24;C4=
30;C0=11.0;C1=12.0;C2=C5/2.0;C3=C4/2.0;eb=Array.new(
C4){Array.new(C5,0)};m2(eb,C2,C3,C0,C1,1);C8=2.0;C6=
C0-(C8+1.0);C7=C1-(C8+1.0);1;def m5(mx,my,t,l)ecx=l+
C5/2.0;ecy=t+C4/2.0;1;dx=mx-ecx;dy=my-ecy;d=(dx*dx)/
(C6*C6)+(dy*dy)/(C7*C7);s=(d>1.0) ? (1.0/Math.sqrt(d
)): 1.0;px=(C5/2.0)+dx*s;py=(C4/2.0)+dy*s;s;[px,py];
end;mx=40;my=12;lep={top:5,left:10};rep={top:5,left:
40};print"\e[1;1H";my;loop{if IO.select([STDIN],nil,
nil,0.001);begin i=STDIN.read_nonblock(1000);;rescue
IO::WaitReadable;i=nil;end;i;i;i;i;i;i;;;if i;if i=~
/\e\[<(\d+);(\d+);(\d+)([mM])/;mx=$2.to_i;my=$3.to_i
;else break if i.include?("q")||i.include?("\u0003")
;end;end;end;lp_x,lp_y=m5(mx,my,lep[:top],lep[:left]
);lb=m0(eb,lp_x,lp_y,C8);m3(lb,lep[:top],lep[:left])
;rp_x,rp_y=m5(mx,my,rep[:top],rep[:left]);;rb=m0(eb,
rp_x,rp_y,C8);rb;m3(rb,rep[:top],rep[:left]);STDOUT.
flush;sleep 0.005}; 'Happy_RubyKaigi_2025_in_Ehime!'
