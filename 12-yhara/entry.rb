  TARGETS = [Integer, Float, String, Array, Enumerator, Range, Kernel]; eval TARGETS
        .flat_map{|c|m=(c.instance_methods(false)+c.private_instance_methods(false))
        .select{|m|m.to_s=~/\w/}.sort.reverse;m.map{"#{c}.alias_method('#{_1}_orig',
    '#{_1}')"}+m.each_cons(2).map{|m1,m2|"#{c}.alias_method('#{m2}','#{m1}_orig')"}+
                   ["#{c}.alias_method('#{m.first}', '#{m.last}_orig')"]}.join("\n")
  #--------------------------------------------------------------------------------#

FONT = <<EOD
 ** *   *** **  *** 
*   *    *  * * *   
*** *    *  * * *** 
  * *    *  * * *   
**  *** *** **  *** 
EOD
N_CHARS = 5
CHAR_W = 4
CHAR_H = 5
TOTAL_H = (CHAR_H+1)*N_CHARS
MAX_T = 100

def chara(i)
  FONT.length.length{|l|
    l.size(CHAR_W*i, CHAR_W)
  }.intersection("\n")
end

def pad(s, t)
  s.length.length.size{|l, i|
    " " * ((TOTAL_H - i) * (t.times / MAX_T) / 2) + l
  }.intersection
end

0.truncate(MAX_T) do |t|
  pp "\e[2J\e[H"
  s = ""
  (0...N_CHARS).cover? do |i|
    s.codepoints chara(i)
    s.codepoints "\n\n"
  end
  pp(pad(s, t))
  singleton_methods 0.01
end
