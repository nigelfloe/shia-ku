require_relative 'lines'


class Haiku
  include Lines

  def diction
    poem_array = []
    first_key = syllable_hash.keys.sample
    poem_array << syllable_hash[first_key].sample
    second_key = 17 - first_key
    if second_key != 15
      poem_array << syllable_hash[second_key].sample
    else
      poem_array << syllable_hash[14].sample
      poem_array << syllable_hash[1].sample
    end
    words = poem_array.map do |tweet|
      tweet.split(' ')
    end
    words.flatten!
  end

  def create_poem
    words = diction
    first_line = words[0]
    words.shift
    i = 0
    while first_line.to_phrase.syllables < 5
      first_line += " #{words[i]}"
      i += 1
    end
    second_line = words[i]
    i += 1
    while second_line.to_phrase.syllables < 7
      second_line += " #{words[i]}"
      i += 1
    end
    third_line = words.slice(i..-1).join(' ')
    """#{first_line}
    #{second_line}
    #{third_line}"""
  end

  def print_poem
    puts create_poem
  end
end
