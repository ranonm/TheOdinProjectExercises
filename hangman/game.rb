require_relative "board"

class Game

  def start
    @board = Board.new

    until board.game_over?
      display

      letter = prompt_player_for_guess
      make_guess(letter)
    end

    display
  end

  private
  def prompt_player_for_guess
    print "Guess a letter: "
    gets.chomp[0]
  end

  def display
    puts board.word_tracker
    puts "#{board.remaining_guesses} left."
    puts "Previous wrong guesses: #{board.wrong_guesses}" unless board.wrong_guesses.empty?
    puts
    puts result unless result.nil?
  end
  
  def result
    if board.win?
      "You won!"
    elsif board.loss?
      "You lost! The word is #{board.word}."
    end
  end

  def make_guess(letter)
    begin
      board.make_guess(letter)
    rescue ArgumentError => e
      puts "Try again dude. #{e.message}"
    rescue => exception
      puts exception
    end
  end

  def board
    @board
  end
end

game = Game.new
game.start