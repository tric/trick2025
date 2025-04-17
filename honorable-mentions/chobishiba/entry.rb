require 'processing'
using Processing

setup { createCanvas(600, 600); textAlign(CENTER, CENTER); i; f }; draw { u; h; r }

def i 
  @d = { s: { c: '✿', r: true, s: 32, co: [255, 105, 180], bg: [255, 182, 193] },
         u: { c: ';', r: false, s: 32, co: [30, 144, 255], bg: [135, 206, 250] },
         a: { c: '♠', r: true, s: 32, co: [204, 85, 0], bg: [204, 163, 0] },
         w: { c: '*', r: false, s: 50, co: [255, 255, 255], bg: [0, 31, 63] } }
  @f, @l, @s, @cs, @ns,  = [], 0.0, @d.keys, :s, :u
end

def u
  bg = lerpColor(color(*@d[@cs][:bg]), color(*@d[@ns][:bg]), @l < 0.5 ? 0 : map(@l, 0.5, 1, 0, 1))
  background(*[red(bg), green(bg), blue(bg), alpha(bg)])
  @l += 1.0 / 600
end

def h
  @l >= 1 && (@l = 0; @cs, @ns = @ns, @s[(@s.index(@ns) + 1) % 4]; f)
end

def f
  150.times { |i| @f << F.new(rand(width), rand(-height * 1.2..0), @d[@cs][:c], @d[@cs][:co], @d[@cs][:s], @d[@cs][:r]) }
end

def r
  @f.reject! { |x| x.u; x.d; x.o }
end

class F
  def initialize(x, y, c, co, s, r)
    @x, @y, @c, @co, @s, @r, @sp, @v = x, y, c, co, s, r ? rand(TWO_PI) : 0, rand(2.0..6.0), r ? rand(-2.0..2.0) : 0
  end

  def u
    @y += @sp; @x += @v; @r += 0.05 if @r != 0
  end

  def d
    push; translate(@x, @y); rotate(@r); fill(*@co); textSize(@s); text(@c, 0, 0); pop
  end

  def o
    @y > height + 20
  end
end
