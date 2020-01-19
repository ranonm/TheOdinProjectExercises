class Player
  attr_reader :name
  attr_accessor :marker

  def initialize(name)
    @name = name
  end

  def ask(question)
    print question
    gets.chomp
  end

  def to_s
    name.capitalize
  end
end