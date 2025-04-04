require_relative 'lib/linked_list'

list = LinkedList.new

list.append('dog')
list.append('cat')
list.prepend('parrot')
list.append('hamster')
list.prepend('snake')
list.append('turtle')

puts list.contains?('cat')
puts list.contains?('rat')

puts list.at(3)
puts list.at(9).inspect

puts list.find('dog')
puts list.find('bat').inspect

puts list.head

puts list.tail

list.pop

list.insert_at('rabbit', 2)
list.insert_at('cow', 99)

list.remove_at(3)
list.remove_at(95)

puts list.size

puts list