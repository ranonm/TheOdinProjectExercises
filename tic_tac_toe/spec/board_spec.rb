require './lib/board.rb'
require './lib/player.rb'
require './lib/selection.rb'

describe Board do
  MARKER_X = "X"
  MARKER_O = "O"

  describe "#winner?" do
    it "returns true when player marked cells 1,2,3" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER_X))
      board.move(Selection.new(2, MARKER_X))
      board.move(Selection.new(3, MARKER_X))

      expect(board.winner?).to be_truthy
    end

    it "returns true when player marked cells 4,5,6" do
      board = Board.new
      
      board.move(Selection.new(4, MARKER_X))
      board.move(Selection.new(5, MARKER_X))
      board.move(Selection.new(6, MARKER_X))

      expect(board.winner?).to be true
    end
    
    it "returns true when player marked cells 7,8,9" do
      board = Board.new
      
      board.move(Selection.new(7, MARKER_X))
      board.move(Selection.new(8, MARKER_X))
      board.move(Selection.new(9, MARKER_X))

      expect(board.winner?).to be true
    end

    it "returns true when player marked cells 1,4,7" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER_X))
      board.move(Selection.new(4, MARKER_X))
      board.move(Selection.new(7, MARKER_X))

      expect(board.winner?).to be true
    end

    it "returns true when player marked cells 2,5,8" do
      board = Board.new
      
      board.move(Selection.new(2, MARKER_X))
      board.move(Selection.new(5, MARKER_X))
      board.move(Selection.new(8, MARKER_X))

      expect(board.winner?).to be true
    end

    it "returns true when player marked cells 3,6,9" do
      board = Board.new
      
      board.move(Selection.new(3, MARKER_X))
      board.move(Selection.new(6, MARKER_X))
      board.move(Selection.new(9, MARKER_X))

      expect(board.winner?).to be true
    end

    it "returns true when player marked cells 1,5,9" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER_X))
      board.move(Selection.new(5, MARKER_X))
      board.move(Selection.new(9, MARKER_X))

      expect(board.winner?).to be true
    end

    it "returns true when player marked cells 1,2,3" do
      board = Board.new
      
      board.move(Selection.new(3, MARKER_X))
      board.move(Selection.new(5, MARKER_X))
      board.move(Selection.new(7, MARKER_X))

      expect(board.winner?).to be true
    end
  end

  describe "#game_over?" do
    it "returns true when a player wins" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER_X))
      board.move(Selection.new(2, MARKER_X))
      board.move(Selection.new(3, MARKER_X))

      expect(board.game_over?).to be true
    end

    it "returns true when there is a tie" do
      board = Board.new

      board.move(Selection.new(1, MARKER_X))
      board.move(Selection.new(2, MARKER_O))
      board.move(Selection.new(3, MARKER_X))
      board.move(Selection.new(4, MARKER_O))
      board.move(Selection.new(5, MARKER_X))
      board.move(Selection.new(6, MARKER_O))
      board.move(Selection.new(7, MARKER_O))
      board.move(Selection.new(8, MARKER_X))
      board.move(Selection.new(9, MARKER_O))

      expect(board.game_over?).to be true
    end
  end

  describe "#tie?" do
    it "returns true when the board is full and there is no winner" do
      board = Board.new

      board.move(Selection.new(1, MARKER_X))
      board.move(Selection.new(2, MARKER_O))
      board.move(Selection.new(3, MARKER_X))
      board.move(Selection.new(4, MARKER_O))
      board.move(Selection.new(5, MARKER_X))
      board.move(Selection.new(6, MARKER_O))
      board.move(Selection.new(7, MARKER_O))
      board.move(Selection.new(8, MARKER_X))
      board.move(Selection.new(9, MARKER_O))

      expect(board.winner?).to be false
      expect(board.tie?).to be true
    end
  end

  describe "#move" do
    valid_positions = (1..9)
    valid_positions.each do |position|
      it "does not raise an error for selection with position #{position}" do
        board = Board.new
        expect { board.move(Selection.new(position, MARKER_X)) }.to_not raise_error
      end
    end

    it "raises SelectionError when selection is 0" do
      board = Board.new
      expect { board.move(Selection.new(0, MARKER_X)) }.to raise_error SelectionError, "Your move should be 1-9"
    end

    it "raises SelectionError when selection has a negative position value" do
      board = Board.new
      expect { board.move(Selection.new(-2, MARKER_X)) }.to raise_error SelectionError, "Your move should be 1-9"
    end

    it "raises SelectionError when selection has a position value greater than 9" do
      board = Board.new
      expect { board.move(Selection.new(10, MARKER_X)) }.to raise_error SelectionError, "Your move should be 1-9"
    end

    it "raises SelectionError when selecting a marked position" do
      board = Board.new
      board.move(Selection.new(1, MARKER_O))
      expect { board.move(Selection.new(1, MARKER_X)) }.to raise_error SelectionError, "Your move should be an unmarked cell"
    end
  end
end