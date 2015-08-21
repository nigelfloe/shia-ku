# require_relative 'arrays/shia_array'

module Lines
  def tweet_array
    short_tweets = SHIA.select do |tweet|
      tweet.to_phrase.syllables <= 17
    end
    short_tweets
  end

  def syllable_hash
    hash = {}
    tweet_array.each do |tweet|
      hash[tweet.to_phrase.syllables] ||= []
      hash[tweet.to_phrase.syllables] << tweet
    end
    hash
  end
end
