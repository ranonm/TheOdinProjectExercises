require_relative "board"

class Game

  def start
    option = prompt_player "Do you want to start a new game? (y/n)"

    case option.downcase
    when "y", "yes"
      @board = Board.new
    when "n", "no"
      filename = prompt_player "Provide the file name for the saved game you want to play:"
      @board = Board.open(filename)
    else
      put "Invalid choice."
      exit
    end

    play
  end

  private

  def prompt_player(question)
    print "#{question} "
    gets.chomp
  end

  def play
    until board.game_over?
      display

      input = prompt_player "Guess a letter ('!'-save or '#'-exit)"

      case input
      when "!"
        board.save
      when "#"
        exit
      else
        make_guess(input[0])
      end
    end

    display
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