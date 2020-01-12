require_relative 'word_tracker'

class Board
  GUESS_LIMIT = 11

  attr_reader :word_tracker, :remaining_guesses

  def initialize
    @secret_word = select_secret_word
    @remaining_guesses = GUESS_LIMIT
    @incorrect_letters = []
    
    # Temporary - this is for testing while in development
    puts @secret_word

    @word_tracker = WordTracker.new(@secret_word.length)
  end

  def make_guess(letter)
    validate(letter)

    return if already_guessed?(letter)

    positions = find_indexes(letter)

    if positions.empty?
      note_wrong_guess(letter)
    else
      @word_tracker.add(letter, positions)
    end
  end

  def game_over?
    win? || loss?
  end

  def win?
    @word_tracker.word_complete?
  end

  def loss?
    @remaining_guesses < 1
  end

  def wrong_guesses
    @incorrect_letters.join(" ")
  end

  def word
    @secret_word if game_over?
  end

  private

  def note_wrong_guess(letter)
    @remaining_guesses -= 1
    @incorrect_letters << letter
  end
  
  def find_indexes(letter)
    (0...@secret_word.length).select do |index|
      @secret_word[index] == letter.downcase
    end
  end

  def already_guessed?(guess)
    @word_tracker.include?(guess) || @incorrect_letters.include?(guess)
  end

  def validate(guess)
    raise ArgumentError, "Argument is nil" if guess.nil?
    raise ArgumentError, "Argument is not a letter" unless guess.is_a? String
  end

  def select_secret_word
    eligible_words = File.readlines("dictionary.txt").select do |word|
      word.strip!.length.between?(5, 12)
    end

    eligible_words.sample.downcase
  end
end