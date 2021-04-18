
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
    # Space Complexity: O(1)
    def add_first(value)
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) with n being the length of the linked list.
    # Space Complexity: O(n) recursive pushes frames onto call stack for length of list.
    def search(value, current = @head)
      return false if current.nil?
      return true if current.data == value
      search(value, current.next)
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) with n being the length of the linked list.
    # Space Complexity: O(n)
    def find_max(max_value = -1.0/0, current = @head)
      return nil if @head.nil?
      return max_value if current.nil?
      if current.data > max_value
        find_max(current.data, current.next)
      else
        find_max(max_value, current.next)
      end
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) with n being the length of the linked list.
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?
      min_value = @head.data
      current = @head
      while current
        if current.data < min_value
          min_value = current.data
        else current = current.next
        end
      end
      return min_value
    end

    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return nil if @head.nil?
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n) since we examine each node to find way to the end
    # Space Complexity: O(n)
    def add_last(value, current = @head)
      return add_first(value) if current.nil? #sets head if list is nil
      return current = Node.new(value, nil) if current.nil? 
      add_last(value, current.next)
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def length(current = @head, length = 0)
      return length if current.nil?
      current = length(current.next, length += 1)
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def get_at_index(index, current = @head)
      return nil if index > length - 1
      return current.data if index.zero?
      get_at_index(index - 1, current.next)
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def visit(current = @head)
      return nil if current.nil?
      print current.value
      visit(current.next)
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n) due to search, delete is O(1)
    # Space Complexity: O(n)
    def delete(value, previous = @head, current = @head)
      return nil if current.nil? # if list is empty
      return @head = @head.next if @head.data == value # if deleting head, 2nd node becomes head, needs special case because there's no previous
      return previous.next = current.next if current.data == value
      delete(value, previous = current, current = current.next)
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def reverse(current = @head)
      return @head = current if current.next.nil? # once hits last node, sets it to head
      reverse(current.next) # runs until reaching last node
      current.next.next = current # second to last node points next of head to itself (and so on)
      current.next = nil # second to last node points next to nil (this gets updated to other values until we reach the first node - which is the whole point)
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def get_last(current = @head)
      return nil if current.nil?
      return current.data if current.next.nil?
      get_last(current.next)
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: ?
    # Space Complexity: ?
    def find_nth_from_end(n)
      raise NotImplementedError
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
