# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # >> Constant num of actions - create new node,
  # set next to old head, set head pointer to new node
  # Space Complexity: O(1)
  # >> Always adding 1 new node
  def add_first(value)
    new_node = Node.new(value)

    new_node.next = @head
    @head = new_node
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # >> Must check every single node in linked list
  # Space Complexity: O(1)
  # >> Just checking for membership; only ever store current_node
  def search(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.data == value

      current_node = current_node.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  def find_max
    return nil if @head.nil?

    current_node = @head
    max = current_node.data

    until current_node.nil?
      max = current_node.data if current_node.data > max
      current_node = current_node.next
    end

    return max
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # >> have to traverse entire linked list (unless we know it's sorted...)
  # Space Complexity: O(1)
  # >> store current_node and min regardless of how long LL is
  def find_min
    return nil if @head.nil?

    current_node = @head
    min = current_node.data

    until current_node.nil?
      min = current_node.data if current_node.data < min
      current_node = current_node.next
    end

    return min
  end


  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # >> pointer to head
  # Space Complexity: O(1)
  # >> don't need to allocate space for vars - just returning value of first node if exists
  def get_first
    return nil if @head.nil?

    return @head.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # >> Have to continue traversing linked list until reach last node (next is nil)
  # >> Conversely, if we had a tail pointer, then this could be O(1) in a doubly-linked list
  # Space Complexity: O(1)
  # >> adding one new node each time (reference in next for an existing node, add new node)
  def add_last(value)
    if @head.nil?
      @head = Node.new(value)
      return
    end

    current_node = @head

    until current_node.next.nil?
      current_node = current_node.next
    end

    current_node.next = Node.new(value)
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # >> traverse length of ll to get num nodes in list
  # Space Complexity: O(1)
  # >> store len integer
  def length
    return 0 if @head.nil?

    len = 1
    current_node = @head.next

    until current_node.nil?
      len += 1
      current_node = current_node.next
    end

    return len
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # >> Traverse up to n nodes to get value at index position
  # Space Complexity: O(1)
  # >> store node_num and current_node
  def get_at_index(index)
    return nil if @head.nil?
    return @head.data if index.zero?

    node_num = 0
    current_node = @head

    until node_num == index || current_node.nil?
      current_node = current_node.next
      node_num += 1 unless current_node.nil?
    end

    return node_num == index ? current_node.data : nil
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # >> Traverse entire LL to print all values
  # Space Complexity: O(1)
  # >> store current node
  def visit
    return nil if @head.nil?

    current_node = @head

    until current_node.nil?
      p current_node.data
      current_node = current_node.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # >> search up to entire list to find node with specified value
  # Space Complexity: O(1)
  # >> keep track of current node
  def delete(value)
    return nil if @head.nil?

    if @head.data == value
      new_head = @head.next
      @head.next = nil
      @head = new_head
    end

    current_node = @head
    until current_node.next.nil?
      if current_node.next.data == value
        current_node.next = current_node.next.next
        return
      end
      current_node = current_node.next
    end

    return nil
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # >> traverse length of LL to reverse all nodes
  # Space Complexity: O(1)
  # >> store previous, current, and next nodes
  def reverse
    return nil if @head.nil?

    previous_node = @head
    current_node = @head.next
    next_node = current_node.next
    @head.next = nil

    until next_node.nil?
      current_node.next = previous_node
      previous_node = current_node
      current_node = next_node
      next_node = current_node.next
    end

    current_node.next = previous_node
    @head = current_node
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # >> traverse length of LL to get to last node
  # Space Complexity: O(1)
  # >> store current node
  def get_last
    return nil if @head.nil?

    current_node = @head

    until current_node.next.nil?
      current_node = current_node.next
    end

    return current_node.data
  end
  
  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n)
  # >> get length of LL (pass through all n nodes)
  # >> go through half of those nodes
  # Space Complexity: O(1)
  # >> store mid_index, current_node, current_node_num
  def find_middle_value
    return nil if @head.nil?

    mid_index = length / 2
    current_node = @head
    current_node_num = 0
    
    until current_node_num == mid_index
      current_node = current_node.next
      current_node_num += 1
    end
    
    return current_node.data
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n)
  # >> pass through all nodes to get length
  # >> at worst pass through all nodes again to get 0th node from end
  # >> 2n --> n
  # Space Complexity: O(1)
  # >> store len, index, current_node, curr_node_num
  def find_nth_from_end(n)
    return nil if @head.nil?

    len = length
    return nil if n >= len # maybe better to throw ArgumentError here

    index = len - n - 1
    current_node = @head
    curr_node_num = 0
    until curr_node_num == index
      current_node = current_node.next
      curr_node_num += 1
    end

    return current_node.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: ?
  # Space Complexity: ?
  def has_cycle
    raise NotImplementedError
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: ?
  # Space Complexity: ?
  def insert_ascending(value)
    raise NotImplementedError
  end

  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty

    # navigate to last node
    current = @head
    while current.next != nil
      current = current.next
    end

    current.next = @head # make the last node link to first node
  end
end
