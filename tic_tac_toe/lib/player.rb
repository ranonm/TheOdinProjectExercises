class Player
  attr_reader :name
  attr_accessor :marker

  def initialize(name)
    @name = name
  end

  def prompt_for_move
    print "#{self}, enter your next #{marker} move (1-9): "
    position = gets.chomp

    Selection.new(position, marker)
  end

  def to_s
    name.capitalize
  end
end