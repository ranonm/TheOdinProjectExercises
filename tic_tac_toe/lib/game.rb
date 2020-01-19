require_relative "selection"
require_relative "board"
require_relative "player"

class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
  end

  def start(name)
    @starting_player = get_player(name)

    if @starting_player.nil?
      puts "I don't know that player. Please try again."
    else
      setup_players

      @board = Board.new

      until board.game_over?
        choose_player
        play
      end
      
      puts status_message
    end
  end

  private

  def play
    loop do
      position = current_player.ask("#{current_player}, enter your next #{current_player.marker} move (1-9): ")
      moved = board.move(current_player, position)

      puts status_message unless status_message.empty?

      board.display

      break if moved
    end
  end

  def setup_players
    markers = ['O','X']
    players.each_with_index do |player, index|
      player.marker = markers[index]
    end
  end

  def choose_player
    if current_player.nil?
      self.current_player = @starting_player
    else
      self.current_player = players.find { |player| player != current_player }
    end
  end

  def get_player(name)
    players.find { |player| player.name.downcase == name.downcase }
  end

  def status_message
    case board.status
    when :win
      "#{current_player}, you won!"
    when :tie
      "The game has been ended in a tie!"
    when :illegal
      "Bad move dude! you go again."
    when :invalid
      "Dude! your move should be 1-9, you go again."
    else
      ""
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