require_relative "selection"
require_relative "board"
require_relative "player"

class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
  end

  def start(name)
    @starting_player = get_player(name)

    puts "I don't know that player. Please try again." if @starting_player.nil?
    
    setup_players

    @board = Board.new

    until board.game_over?
      choose_player
      play
    end
    
    puts result
  end

  private

  def play
    loop do
      begin
        selection = current_player.prompt_for_move
        board.move(selection)
        break
      rescue SelectionError => exception
        puts "#{exception.message}, you go again."
      ensure
        board.display
      end
    end
  end

  def setup_players
    markers = ['O','X']
    players.each_with_index do |player, index|
      player.marker = markers[index]
    end
  end

  def choose_player
    self.current_player = current_player.nil? ?
      @starting_player : 
      players.find { |player| player != current_player }
  end

  def get_player(name)
    players.find { |player| player.name.downcase == name.downcase }
  end

  def result
    if board.winner?
      "#{current_player}, you won!"
    elsif board.tie?
      "Game ended in a tie!"
    else
      "No result yet."
    end
  end

  def current_player=(player)
    @current_player = player
  end

  def current_player
    @current_player
  end

  def board
    @board
  end

  def players
    @players
  end
end