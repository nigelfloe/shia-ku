require_relative '../config/environment'


# redacted = shia.delete_if do |tweet|
#   tweet.match(/@|#|^RT|\d|http:/)
# end
#
# File.open('lib/arrays/shia_redacted.rb', 'w+') {|f| f.write(p redacted)}
#
# binding.pry

# tweet_words = shia.map do |tweet|
#   tweet.split(' ')
# end
#
#
# redacted = tweet_words.map do |word_array|
#   word_array.delete_if {|word| word.match(/\d|^RT$/)}
#   word_array.each {|word| word.downcase!}
#   # word_array.delete_if {|word| word.match(/@\w+|#\w+|http.+|^RT$|\d/)}
# end
#
# redacted = redacted.reject(&:empty?)
#
# cleaned_tweets = redacted.map do |word_array|
#   word_array.join(' ')
# end


shia = SHIA

short_tweets = shia.select do |tweet|
  tweet.to_phrase.syllables <= 17
end
binding.pry

syllable_sort = {}
short_tweets.each do |tweet|
  syllable_sort[tweet.to_phrase.syllables] ||= []
  syllable_sort[tweet.to_phrase.syllables] << tweet
end

binding.pry

# short_tweets.uniq!


# five_tweets = cleaned_tweets.select do |tweet|
#   tweet.to_phrase.syllables == 5
# end
#
# five_tweets.uniq!
#
# seven_tweets = cleaned_tweets.select do |tweet|
#   tweet.to_phrase.syllables == 7
# end





vocabulary = words.flatten

p vocabulary.delete_if {|word| word.match(/@(\w+)|^http.+/)}
