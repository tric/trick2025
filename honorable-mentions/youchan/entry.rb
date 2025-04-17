s=30;g=[0]*(s+2)**2;[100,133,163,164,165].each{g[_1]=1};100.times{s.times{|y|puts s.times.map{g[_1+s+3+y*(s+2)]==1??*:?.}.join};(s*s).times.map{|i| i+=i/s*2;[0,1,2,3,5,6,7,8].map{g[i+_1%3+_1/3*2+_1/3*s]}.sum.then{_1==3?1:_1==2?g[i+s+3]:0}}.tap{|n|(s*s).times{g[_1+s+3+_1/s*2]=n[_1]}};sleep(0.1);print"\e[#{s}A"}
<<C
></C>
<script>
  document.t = document.createNodeIterator(document.body,NodeFilter.SHOW_TEXT).nextNode();
  document.t.remove();
</script>
<script src="https://cdn.jsdelivr.net/npm/@ruby/3.3-wasm-wasi@2.6.2/dist/browser.script.iife.js"></script>
<style>
  .row {
    display: flex;
  }
  .cell {
    width: 10px;
    height: 10px;
    background-color: #eeeeee;
  }
  .on {
    background-color: #aaaaaa;
  }
</style>

<h1>Game of Life</h1>
<div id='board'></div>

<script type="text/ruby" data-eval="async">
  require 'js'
  d=JS.global[:document]
  b=d.getElementById('board')
  s=30
  s.times do |y|
    r=d.createElement('div')
    r[:classList].add('row')
    b.append(r)
    s.times do |x|
      c=d.createElement('div')
      c[:classList].add('cell')
      c.setAttribute("id", 'cell' + (y*s+x).to_s)
      r.append(c)
    end
  end
  module Kernel
    def print(str)
      @row = 0
    end
    def sleep(time)
      JS.eval('return new Promise((resolve) => setTimeout(resolve,'+(time * 1000).to_s+'))').await
    end
    def puts(str)
      @row ||= 0
      d=JS.global[:document]
      str.each_char.with_index do |ch,i|
        if ch == '*'
          d.getElementById('cell'+(@row*30+i).to_s)[:classList].add('on')
        else
          d.getElementById('cell'+(@row*30+i).to_s)[:classList].remove('on')
        end
      end
      @row += 1
    end
  end
  str=eval JS.global[:document][:t][:data].to_s.sub(/<$/, '')
</script>
<!--
C
#-->
