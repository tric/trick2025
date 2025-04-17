eval $s=<<'TRICK'
require "cgi"
require "js"
require "prism"

@s = String.new
def p(s) = @s << s

def tag(t, s, c) = "<#{t} class=#{c}>#{s}</#{t}>"
def span(s, c) = tag("span", s, c)

def ruby(t)
  s = CGI.escape_html(t.value)
  if r = rt(t)
    tag("ruby", s + tag("rp", "(", "") + tag("rt", r, "") + tag("rp", ")", ""), t.type)
  else
    span(s, t.type)
  end
end

def kana(s)
  s
    &.scan(/.{2}/)
    &.map{|c| (0x30A0 + c.to_i).chr(Encoding::UTF_8)}
    &.*("")
end

def rt(t)
  r = {
    :"&&" => "1136",
    :"=" => "04199275",
    :"||" => "623147",
    :$s => "41750825",
    :* => "111775",
    :+ => "557325",
    :- => "62044225",
    :<< => "02588341",
    :@s => "0235400825",
    LESS: "2371064274",
    USTAR: "",
    c: "2392",
    cgi: "239224920204",
    chr: "336792",
    def: "3953",
    document: "411369658340",
    downcase: "320683179225",
    each: "043533",
    else: "087525",
    encoding: "0883199239038316",
    end: "088341",
    end_column: "088341117364",
    end_line: "088341730483",
    end_with?: "088341060326",
    escape_html: "082517925508043338039208640875",
    getelementbyid: "183540087665834048040204390392",
    global: "1677924875",
    if: "0453",
    innerhtml: "0483429208043338039208640875",
    js: "2407920825",
    kana: "1142",
    l: "0875",
    lex: "76351525",
    location: "771792237183",
    map: "623555",
    new: "436992",
    nil: "4375",
    p: "5292",
    prism: "55742664",
    r: "029275",
    require: "7415790402",
    rp: "0292755292",
    rt: "029275380392",
    ruby: "7551",
    s: "0825",
    scan: "25136783",
    span: "254983",
    star: "111775",
    start_column: "25319240117364",
    start_line: "25319240730483",
    string: "2540748316",
    t: "380392",
    tag: "3116",
    to_i: "4005920204",
    type: "310455",
    utf_8: "70923803920853080440",
    value: "48746992",
    x: "08351525",
    y: "7904",
  }
  kana(
    r[:"#{t.type}"] ||
    r[s = :"#{t.value.downcase}"] ||
    s.end_with?(":") && r[:"#{s[..-2]}"] ||
    nil
  )
end

y = 1
x = 0
Prism.lex($s).value[..-2].each {|t, *|
  l = t.location
  r = l.start_line
  if y < r
    p "\n" * (r - y)
    x = 0
  end
  c = l.start_column
  if x < c
    p " " * (c - x)
  end
  p ruby(t)
  y = l.end_line
  x = l.end_column
}

JS.global[:document].getElementById("src")[:innerHTML] =
  span("eval $s=<<'TRICK'\n", "COMMENT") +
  @s +
  span("TRICK\n", "COMMENT")
TRICK
