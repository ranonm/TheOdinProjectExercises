class Calculator
  def add(*numbers)
    numbers.reduce {|sum, number| sum + number}
  end
end