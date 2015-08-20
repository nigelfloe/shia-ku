require_relative '../config/environment'

shia = SHIA.uniq

tweet_words = shia.map do |tweet|
  tweet.split(' ')
end
binding.pry

redacted = tweet_words.map do |word_array|
  word_array.delete_if {|word| word.match(/\W|\d|^RT$/)}
  word_array.each {|word| word.downcase!}
  # word_array.delete_if {|word| word.match(/@\w+|#\w+|http.+|^RT$|\d/)}
end

redacted = redacted.reject(&:empty?)

cleaned_tweets = redacted.map do |word_array|
  word_array.join(' ')
end

five_tweets = cleaned_tweets.select do |tweet|
  tweet.to_phrase.syllables == 5
end

five_tweets.uniq!

seven_tweets = cleaned_tweets.select do |tweet|
  tweet.to_phrase.syllables == 7
end





vocabulary = words.flatten

p vocabulary.delete_if {|word| word.match(/@(\w+)|^http.+/)}
