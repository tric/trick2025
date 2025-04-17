require 'json'
TARGETS = [Integer, Float, String, Array, Enumerator, Range, Kernel]

data = {}
TARGETS.each do
  methods = (
      _1.instance_methods(false) +
      _1.private_instance_methods(false)
    )
    .select{|m| m.to_s =~ /\w/}
    .sort
  data[_1.name] = methods
end
json = JSON.pretty_generate(data)
File.write("checked.txt", json)
if File.read("checklist.txt") == json
  puts "OK"
else
  puts "NG (try diff checked.txt checklist.txt)"
end
