keys = Hash.new 0

ARGF.each do |line|
  key,value = line.chomp.split /:/
  keys[key] = keys[key].to_i + Integer(value)
end
for key, value in keys
  puts "#{key}:#{value}"
end
