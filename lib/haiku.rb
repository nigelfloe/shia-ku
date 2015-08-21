require_relative 'lines'


class Haiku
  attr_reader :first_line, :second_line, :third_line
  include Lines

  def diction
    poem_array = []
    first_key = syllable_hash.keys.sample
    poem_array << syllable_hash[first_key].sample
    second_key = 17 - first_key
    if second_key > 0 && second_key != 15
      poem_array << syllable_hash[second_key].sample
    elsif second_key > 0
      poem_array << syllable_hash[14].sample
      poem_array << syllable_hash[1].sample
    end
    words = poem_array.map do |tweet|
      tweet.split(' ')
    end
    # binding.pry
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
    # binding.pry
    @first_line = first_line.strip
    @second_line = second_line.strip
    @third_line = third_line.strip
  end

  def poem
    create_poem
    puts @first_line
    puts @second_line
    puts @third_line
  end
end
