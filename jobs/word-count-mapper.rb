def words_from line
  line.chomp
  line.split(/\s+/)
end

def acceptable word
  %W%war peace%.include? word.downcase
end

ARGF.each do |line|
  for word in words_from(line)
    puts "#{word.downcase}:1" if acceptable word
  end
end
