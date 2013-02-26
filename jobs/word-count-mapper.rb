def process line
  for word in words_from(line)
    puts "#{word.downcase}\t1" if acceptable word
  end
end

def words_from line
  line.chomp
  line.split(/\s+/)
end

def acceptable word
  %W%war peace%.include? word.downcase
end

ARGF.each do |line|
  if line.is_a? Array
    line.each { |actual| process line }
  else
    process line
  end
end
