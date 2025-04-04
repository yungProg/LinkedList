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

  def tail
    return nil if @head.nil?
    current_node = @head
    while current_node
      return current_node unless current_node.next_node
      current_node = current_node.next_node
    end
  end

  def at(index)
    current_node = @head
    counter = 0
    while current_node
      return current_node if index == counter
      current_node = current_node.next_node
      counter += 1
    end
  end

  def pop
    last_node = self.tail
    @head = nil if @head == last_node
    current_node = @head
    while current_node
      if current_node.next_node == last_node
        current_node.next_node = nil
        return last_node
      end
      current_node = current_node.next_node
    end
    last_node
  end

  def contains?(value)
    current_node = @head
    while current_node
      return true if value == current_node.value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    counter = 0
    current_node = @head
    while current_node
      return counter if value == current_node.value
      counter += 1
      current_node = current_node.next_node
    end
  end

  def insert_at(value, index)
    return prepend(value) if index == 0
    new_node = Node.new(value)
    counter = 0
    current_node = @head
    breakpoint = nil
    while current_node
      unless current_node.next_node
        breakpoint = new_node
        break
      end
      if index == counter + 1
        breakpoint = current_node.next_node
        current_node.next_node = new_node
      end
      current_node = current_node.next_node
      break if new_node == current_node
      counter += 1
    end
    current_node.next_node = breakpoint if breakpoint
  end

  def remove_at(index)
    current_node = @head
    if index == 0
      current_node = current_node.next_node
      @head = nil
      @head = current_node
      return
    end
    counter = 0
    breakpoint = nil
    while current_node
      if index == (counter + 1)
        breakpoint = current_node.next_node
        current_node.next_node = nil
        current_node.next_node = breakpoint.next_node
        break
      end
      return unless current_node.next_node
      current_node = current_node.next_node
      counter += 1
    end
  end

  def to_s
    output = ''
    current_node = @head
    while current_node
      output += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    output += 'nil'
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value=nil)
    @value = value
    @next_node = nil
  end
end