class Selection
  attr_reader :position, :marker

  def initialize(position, marker)
    self.position = position
    @marker = marker
  end

  private
  
  def position=(position)
    @position = position.to_i - 1
  end
end