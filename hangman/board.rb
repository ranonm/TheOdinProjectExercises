require_relative 'word_tracker'
require_relative 'game_state'

class Board
  GUESS_LIMIT = 11
  DIRECTORY_PATH = "./saved_games"

  attr_reader :word_tracker

  def initialize(game_state=nil)
    load_game_state(game_state)
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
    @game_state.remaining_guesses < 1
  end

  def wrong_guesses
    @game_state.incorrect_letters.join(" ")
  end
  
  def remaining_guesses
    @game_state.remaining_guesses
  end

  def word
    @game_state.secret_word if game_over?
  end

  def save
    save_to_file(@game_state.to_json, "#{@game_state.id}.json")
  end

  def self.open(filename)
    validate_filename(filename)

    return unless Dir.exist?(DIRECTORY_PATH)
    
    file_path = "#{DIRECTORY_PATH}/#{filename}"
    
    raise StandardError, "Cannot find file for path: #{file_path}." unless File.exist?(file_path)

    data = File.open(file_path).readlines
    game_state = GameState.from_json(data[0])
    
    self.new(game_state)
  end

  private

  def self.validate_filename(filename)
    if filename.empty? || filename.nil? || !filename.is_a?(String)
      raise ArgumentError, "Filename must be a String"
    end
  end

  def load_game_state(game_state)
    if game_state.nil?
      @secret_word = select_secret_word
      @game_state = GameState.new(@secret_word, GUESS_LIMIT)
    else
      @game_state = game_state
    end

    @word_tracker = WordTracker.new(@game_state.incomplete_word)
  end

  def note_wrong_guess(letter)
    @game_state.remaining_guesses -= 1
    @game_state.incorrect_letters << letter
  end

  def find_indexes(letter)
    (0...@game_state.secret_word.length).select do |index|
      @game_state.secret_word[index] == letter.downcase
    end
  end

  def already_guessed?(guess)
    @word_tracker.include?(guess) || @game_state.incorrect_letters.include?(guess)
  end

  def validate(letter)
    raise ArgumentError, "Argument is nil" if letter.nil?
    raise ArgumentError, "Argument is not a letter" unless letter.is_a? String
  end

  def select_secret_word
    eligible_words = File.readlines("dictionary.txt").select do |word|
      word.strip!.length.between?(5, 12)
    end

    eligible_words.sample.downcase
  end

  def save_to_file(game_data, filename)
    Dir.mkdir(DIRECTORY_PATH) unless Dir.exist?(DIRECTORY_PATH)

    File.open("#{DIRECTORY_PATH}/#{filename}", 'w') do |file|
      file.puts game_data
    end
  end
end