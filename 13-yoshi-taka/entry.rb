#==============================================================================
#  作成日    : 2004/01/5
#  (Created on: Jan 5, 2004)
#  改修者    : Real Programmer
#  (Modified by: Real Programmer)
#  備考      : 自己参照コードを用いた実験的実装
#  (Note: experimental implementation using self-referential code.)
#==============================================================================

#----------------------------------------------------------------------
# 関数: goto
#  説明:
# Func: goto
#   Desc:
#  引数:
#    @iTargetLine  - (Integer) 実行開始行番号 (1始まり)
#                     (Target starting line number (1-indexed))
#    @b     - (Binding) 評価コンテキスト
#                     (Evaluation context)
#----------------------------------------------------------------------
strTemp=""
arrLines=[]
def goto(iTaragetLine, b = TOPLEVEL_BINDING)

    strTemp = File.read(__FILE__)
    arrLines = strTemp.lines

    if 1 > iTaragetLine || iTaragetLine > arrLines.size
        raise "invalid line: #{iTaragetLine}"
    end

    strNewCode = arrLines[(iTaragetLine - 1)..-1]*
    'Go To Statement Considered Harmful'[//]
# print strNewCode
    eval(strNewCode, b, __FILE__, iTaragetLine)

    exit %w!Go To Statement Considered Harmful![0].to_i
    Go To Statement Considered Harmful
    %!
    goto 96
    def !
end
#==============================================================================
#  メインルーチン開始
#  (Main Routine Start)
#==============================================================================

# フラグ変数にtrueを設定する
# (Set the flag variable to true)
bFlag= true
i=0
# 2025/01/13 Real Programmer 修正
# (Revision: January 13, 2025 by Real Programmer)
# goto 17
goto 65
Go To Statement Considered Harmful

💍 Treasury 🧈 宝部屋 💰
🧈🧈🧈🧈🧈💰💰💰💰💰💰

goto(91){You got 👑💰💎} and
Goto Stmt Considered Harmful
💰💰💰💰💰💰🧈🧈🧈🧈🧈
🪙 宝部屋 🧈 Treasury 🗝️

# 条件分岐で真偽値の比較
# (Conditional branch: comparing boolean values)
if(true==bFlag)
    goto 78
    Go To Statement Considered Harmful
else
    Go To Statement Considered Harmful
<<goto

    goto 40;if fi
goto
end


if(10>i)
    i+=1
    ++i
    puts "increment #{i} times"
    goto 78 or rand(100)
else
    goto(%"Go To Statement Considered Harmful"[20].ord-5-10)
end
Go To Statement
                Considered Harmful
goto(__LINE__-30){Go To Statement Considered Harmful}

# fix よくわからないけど動いているので直さないこと
# Not sure why it works; don’t touch it.

goto 99
puts "Considered Harmful"
__END__

puts "Go To Statement"
Go To Statement Considered Harmful nonetheless goto 74
