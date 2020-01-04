def substrings(phrase, valid_substrings)
    substring_frequency = {}
    valid_substrings.each do |substring|
        frequency = phrase.downcase.scan(substring).length
        substring_frequency[substring] = frequency if frequency > 0
    end
    return substring_frequency
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)