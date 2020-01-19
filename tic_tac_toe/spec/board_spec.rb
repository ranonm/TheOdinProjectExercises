require './lib/board.rb'
require './lib/player.rb'
require './lib/selection.rb'

describe Board do
  describe "#game_over?" do
    MARKER = "X"

    it "returns true when player marked cells 1,2,3" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER))
      board.move(Selection.new(2, MARKER))
      board.move(Selection.new(3, MARKER))

      expect(board.game_over?).to be_truthy
    end

    it "returns true when player marked cells 4,5,6" do
      board = Board.new
      
      board.move(Selection.new(4, MARKER))
      board.move(Selection.new(5, MARKER))
      board.move(Selection.new(6, MARKER))

      expect(board.game_over?).to be_truthy
    end
    
    it "returns true when player marked cells 7,8,9" do
      board = Board.new
      
      board.move(Selection.new(7, MARKER))
      board.move(Selection.new(8, MARKER))
      board.move(Selection.new(9, MARKER))

      expect(board.game_over?).to be_truthy
    end

    it "returns true when player marked cells 1,4,7" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER))
      board.move(Selection.new(4, MARKER))
      board.move(Selection.new(7, MARKER))

      expect(board.game_over?).to be_truthy
    end

    it "returns true when player marked cells 2,5,8" do
      board = Board.new
      
      board.move(Selection.new(2, MARKER))
      board.move(Selection.new(5, MARKER))
      board.move(Selection.new(8, MARKER))

      expect(board.game_over?).to be_truthy
    end

    it "returns true when player marked cells 3,6,9" do
      board = Board.new
      
      board.move(Selection.new(3, MARKER))
      board.move(Selection.new(6, MARKER))
      board.move(Selection.new(9, MARKER))

      expect(board.game_over?).to be_truthy
    end

    it "returns true when player marked cells 1,5,9" do
      board = Board.new
      
      board.move(Selection.new(1, MARKER))
      board.move(Selection.new(5, MARKER))
      board.move(Selection.new(9, MARKER))

      expect(board.game_over?).to be_truthy
    end

    it "returns true when player marked cells 1,2,3" do
      board = Board.new
      
      board.move(Selection.new(3, MARKER))
      board.move(Selection.new(5, MARKER))
      board.move(Selection.new(7, MARKER))

      expect(board.game_over?).to be_truthy
    end
  end
end