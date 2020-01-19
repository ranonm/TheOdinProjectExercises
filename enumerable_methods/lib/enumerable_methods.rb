module Enumerable
  def my_each
    index = 0
    while index < self.length
      yield(self[index])
      index+=1
    end
    self
  end

  def my_each_with_index
    index = 0
    while index < self.length
      yield(self[index], index)
      index+=1
    end
    self
  end

  def my_select
    selected_elements = []
    self.my_each do |element|
      selected_elements << element if yield(element)
    end
    selected_elements
  end

  def my_all?
    self.my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    self.my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    self.my_each { count+=1 }
    count
  end

  def my_map(proc=nil)
    result = []
    self.my_each do |element|
      proc.nil? ? result << yield(element) : result << proc.call(element)
    end
    result
  end

  def my_inject
    result = self[0]
    self[1..-1].my_each do |element|
      result = yield(result, element)
    end
    result
  end
end

def multiply_els(elements)
  elements.my_inject {|product, n| product * n }
end