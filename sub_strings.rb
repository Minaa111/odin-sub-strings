def substrings(string, dictionary)
    words = string.split(' ') 
    
    words.each do |word|
        word.gsub!(/[^0-9A-Za-z]/, '')
    end

    substrings_hash = Hash.new

    words.each do |word|
        word = word.downcase
        dictionary.each do |dic_word|
            dic_word = dic_word.downcase
            if word.include?(dic_word)
                if !substrings_hash.has_key?(dic_word)
                    substrings_hash[dic_word] = 1
                else
                    substrings_hash[dic_word] += 1
                end
            end
        end
    end

    substrings_hash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner", "sit"]

puts substrings("below", dictionary) # Expected: {"below"=>1, "low"=>1}

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
# Expected: {"how"=>2, "howdy"=>1, "part"=>1, "partner"=>1, "it"=>2, "i"=>3, "sit"=>1, "down"=>1, "own"=>1, "go"=>1, "going"=>1}
