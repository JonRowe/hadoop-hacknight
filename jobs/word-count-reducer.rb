keys = Hash.new 0

ARGF.each do |line|
  key,value = line.chomp.split /:/
  keys[key] += value
end

keys
