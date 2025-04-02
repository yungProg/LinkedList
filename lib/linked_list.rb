class LinkedList
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
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value=nil)
    @value = value
    @next_node = nil
  end
end