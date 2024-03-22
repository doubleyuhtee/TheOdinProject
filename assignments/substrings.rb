def substrings(word, dictionary)
  out = {}
  dictionary = dictionary.map{|w| w.downcase}
  word = word.downcase
  dictionary.each do |test|
    count = word.scan(test).length
    out[test] = count unless count == 0
  end
  out
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)