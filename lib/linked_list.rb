class LinkedList
  #method to return first node in the list
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
    else
      current_node = @head
      while current_node.next_node
        current_node = current_node.next_node
      end
      current_node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
  end

  def size
    counter = 0
    current_node = @head
    while current_node
      counter += 1 if current_node.value
      current_node = current_node.next_node
    end
    counter
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value=nil)
    @value = value
    @next_node = nil
  end
end