class Board
  attr_reader :status

  def initialize
    @cells = Array.new(9)
  end

  def move(player, position)
    @selection = Selection.new(position, player.marker)

    return false unless approved_move?

    mark_cell
    redraw

    true
  end

  def game_over?
    if winner?
      self.status = :win
      true
    elsif tie?
      self.status = :tie
      true
    else
      false
    end
  end

  def display
    @grid.each do |row|
      row.each do |cell|
        if cell.nil?
          print "-"
        else
          print cell
        end
      end
      puts " "
    end
  end

  private

  def winner?
    if @selection.nil?
      return false
    end

    possible_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6],
    ]

    possible_combinations.any? do |combination|
      combination.all? { |position| cells[position] == @selection.marker }
    end
  end

  def tie?
    not winner? and full?
  end

  def full?
    cells.all? { |cell| not cell.nil? }
  end

  def approved_move?
    if not valid_move?
      self.status = :invalid
      false
    elsif not legal_move?
      self.status = :illegal
      false
    else
      self.status = nil
      true
    end
  end

  def valid_move?
    @selection.position.between?(0,8)
  end

  def legal_move?
    cells[@selection.position].nil?
  end

  def mark_cell
    cells[@selection.position] = @selection.marker
  end

  def redraw
    @grid = [cells[0..2], cells[3..5], cells[6..8]]
  end

  def cells
    @cells
  end

  def status=(msg)
    @status = msg
  end
end