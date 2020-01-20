require_relative 'selection_error'

class Board

  def initialize
    @cells = Array.new(9)
  end

  def move(selection)
    @selection = selection
    
    ensure_legit_move

    mark_cell
    redraw
  end

  def game_over?
    winner? or tie?
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

  def winner?
    return false if @selection.nil?

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
    full? and not winner?
  end

  private

  def ensure_legit_move
    if not valid_move?
      raise SelectionError.new "Your move should be 1-9"
    elsif not legal_move?
      raise SelectionError.new "Your move should be an unmarked cell"
    end
  end

  def valid_move?
    @selection.position.between?(0,8)
  end

  def legal_move?
    cells[@selection.position].nil?
  end

  def full?
    cells.all? { |cell| not cell.nil? }
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
end