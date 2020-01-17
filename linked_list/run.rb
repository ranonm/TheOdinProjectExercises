require_relative "./lib/linked_list"

linked_list = LinkedList.new

a = Node.new("A")
b = Node.new("B")
c = Node.new("C")
z = Node.new("Z")

linked_list.append b
linked_list.append c 
linked_list.append z
linked_list.prepend a
puts linked_list
puts "There are #{linked_list.size} elements in the linked list."

puts "#{linked_list.head.value} is at the head of the linked list."
puts "#{linked_list.tail.value} is at the tail of the linked list."

node = linked_list.at 1
puts "The node at index 1 is #{node.value}."

node = linked_list.pop
puts "The linked list looks like: #{linked_list} after popping #{node.value}."

puts "Does linked list contain B: #{linked_list.contains?("B")}."
puts "Does linked list contain E: #{linked_list.contains?("E")}."

puts "B is located at index: #{linked_list.find("B")}."
puts "E is located at index: #{linked_list.find("E")}."

node = Node.new("D")
linked_list.insert_at(1, node)
puts "Insert D at index 1, resulting in: #{linked_list}."

linked_list.remove_at(1)
puts "Remove item at index 1, resulting in: #{linked_list}."