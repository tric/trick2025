WARNING

   Make sure you use Ruby 3.4.2.

   Otherwise I don't know what happens.
   (Try `ruby checker.rb` first to check if your Ruby is "compatible" to 3.4.2.)


HOW TO RUN

   Before running, try reading entry.rb (except the first block).
   Can you guess what it does?

   Run `ruby entry.rb` to see.


SPOILER

   This script "slides" method definitions to the next (in dictionary order)
   method. So for example `"foo".length` actually works as `.lines` (and
   coincidentally, `[].map` also slides into `.lines`).

   Sliding are not applied to methods whose name is made with symbols (like `+`,
   `-`). Reason: if `[]` is shifted to `[]=`, there is no way to call 
   it (without eval or something).

   Before:
     x[y]

   After:
     x[y]=    # Syntax error

ORIGINAL CODE

  It's just a idiomatic Ruby program.

  def chara(i)
    FONT.lines.map{|l|
      l.slice(CHAR_W*i, CHAR_W)
    }.join("\n")
  end

  def pad(s, t)
    s.lines.map.with_index{|l, i|
      " " * ((TOTAL_H - i) * (t.to_f / MAX_T) / 2) + l
    }.join
  end

  0.upto(MAX_T) do |t|
    print "\e[2J\e[H"
    s = ""
    (0...N_CHARS).each do |i|
      s.concat chara(i)
      s.concat "\n\n"
    end
    print(pad(s, t))
    sleep 0.01
    break
  end
