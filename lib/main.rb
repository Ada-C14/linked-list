require './linked_list'

my_list = LinkedList.new()

my_list.add_last(9)
my_list.add_last(10)
my_list.add_first(4)
my_list.add_first(3)
my_list.add_first(2)

p my_list.visit
p my_list.length
my_list.reverse
p my_list.visit