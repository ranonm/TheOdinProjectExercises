class Calculator
  def add(*numbers)
    numbers.reduce { |sum, number| sum + number }
  end

  def multiply(*numbers)
    numbers.reduce { |product, number| product * number }
  end
end