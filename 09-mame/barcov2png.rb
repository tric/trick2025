require"zlib"
$stdout.binmode
a=eval($<.read)["entry.rb"]
b="IHDR",[a.size,50,1].pack("NNCx4")
c="IDAT",Zlib.deflate([a.map{1-_1}*""].pack("xB*")*50)
print"\x89PNG\r\n\x1a\n",*[b,c,["IEND",""]].map{|e,d|[d.size,e,d,Zlib.crc32(e+d)].pack("NA4A*N")}
