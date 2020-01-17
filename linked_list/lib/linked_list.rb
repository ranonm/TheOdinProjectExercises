require_relative "node"

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(node)
    @head.nil? ? @head = node : @head.next_node = node
  end

  def prepend(node)
    node.next_node = @head
    @head = node
  end

  def size
    count = 0
    current_node = @head

    until current_node.nil?
      count += 1
      current_node = current_node.next_node
    end

    count
  end

  def tail
    nil if @head.nil?

    current_node = @head

    until current_node.next_node.nil?
      current_node = current_node.next_node
    end

    current_node
  end

  def at(index)
    current_node = @head
    current_index = 0

    until current_node.nil?
      return current_node if current_index == index
      current_node = current_node.next_node
      current_index += 1
    end
  end

  def pop
    return if @head.nil?

    current_node = @head

    if @head.next_node.nil?
      @head = nil
      return current_node
    end

    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end

    previous_node.next_node = nil
    
    current_node
  end

  def contains?(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = @head
    current_index = 0

    until current_node.nil?
      return current_index if current_node.value == value

      current_node = current_node.next_node
      current_index += 1
    end

    nil
  end

  def insert_at(index, node)
    if index == 0
      node.next_node = @head
      @head = node

      return
    end
    
    previous_node = at(index - 1)

    raise ArgumentError.new "Index out of bound" if previous_node.nil?

    node.next_node = previous_node.next_node
    previous_node.next_node = node
  end

  def remove_at(index)

    if index == 0
      @head = @head.next_node

      return
    end

    previous_node = at(index - 1)

    raise ArgumentError.new "Index out of bound" if previous_node.nil?

    node_to_remove = previous_node.next_node
    previous_node.next_node = node_to_remove.next_node
  end

  def to_s
    current_node = self.head
    output = ""

    until current_node.nil?
      output << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    
    output << "nil"
  end
end