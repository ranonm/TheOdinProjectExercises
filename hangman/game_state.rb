require 'json'

class GameState
  attr_accessor :secret_word, :incomplete_word, :remaining_guesses, :incorrect_letters
  attr_reader :id

  def initialize(secret_word, remaining_guesses, incomplete_word=nil, incorrect_letters=[], id=nil)
    @id = id.nil? ? self.object_id : id
    @secret_word = secret_word
    @remaining_guesses = remaining_guesses
    @incomplete_word = incomplete_word.nil? ? Array.new(@secret_word.length) : incomplete_word
    @incorrect_letters = incorrect_letters
  end

  def to_json
    JSON.dump({
      id: @id,
      secret_word: @secret_word,
      remaining_guesses: @remaining_guesses,
      incomplete_word: @incomplete_word,
      incorrect_letters: @incorrect_letters
    })
  end

  def self.from_json(string)
    data = JSON.load(string)
    self.new(data["secret_word"], data["remaining_guesses"], data["incomplete_word"], data["incorrect_letters"], data["id"])
  end
end