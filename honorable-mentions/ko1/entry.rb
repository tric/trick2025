''.sub!(//,'')
??.delete!''            # need a non-empty receiver
''.encode!              # do not need arguments
''.next!
''.prepend''
''.replace''

''.clear
''.capitalize!
"\x81".scrub!?*
''.insert$.,''
''.bytesplice(..p, '')  # accepts infinite ranges
''.lstrip!

''.chomp!
''.force_encoding('UTF-8')
''.gsub!'',''
'_'.setbyte$.,0
''.strip!



:''.to_s<<''.reverse!   # 2 warnings
'_'.tr!'',''

''.rstrip!
''.succ!
''.swapcase!

''.downcase!

''.concat               # do not need arguments
''.unicode_normalize!
''.chop!
''.delete_suffix!''
''.squeeze!






''['']=''










BEGIN{$f=[];def Warning.warn(_)=[_[/#{__method__}ing:.+/],
caller_locations.first].tap{$f<<[_1,_2.label,_2.lineno]}}

















''.delete_prefix!''











''.upcase!








'_'.tr_s!'',''          # need a non-empty receiver




puts $f.sort.map{_1[_3]}*''
