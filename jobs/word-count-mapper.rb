def words_from line
  line.chomp
  line.split.split(/\s+/)
end

def acceptable word
  %W%war peace%.include? word.downcase
end

ARGF.each do |line|
  for word in words_from(line)
    puts "#{word}:1" if acceptable word
  end
end
