
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
    # Time Complexity: O(1), because the new node is always add at the beginning of the lilnked list
    # Space Complexity: O(1), because the variables used here is a constant 
    def add_first(value)
      return @head = Node.new(value) if @head.nil?
      add_node = Node.new(value)
      add_node.next = @head
      @head = add_node
      return @head
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to find the answer
    # Space Complexity: O(1), because the variables used here is a constant
    def search(value)
      pointer = @head
      while pointer
        return true if pointer.data == value
        pointer = pointer.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), because it needs to loop thru all linked list to find the max value
    # Space Complexity: O(1), because the variables used here is a constant
    def find_max
      return nil if @head.nil?
      max = @head.data
      pointer = @head
      while pointer.next
        pointer = pointer.next
        pointer.data > max ? max = pointer.data : max
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), because it needs to loop thru all linked list to find the min value
    # Space Complexity: O(1), because the variables used here is a constant
    def find_min
      return nil if @head.nil?
      min = @head.data
      pointer = @head
      while pointer.next
        pointer = pointer.next
        pointer.data < min ? min = pointer.data : min
      end
      return min
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1), because the first node is always at the beginning of the lilnked list
    # Space Complexity: O(1), no extra variable is used in this case
    def get_first
      return @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n), because it needs to loop thru all linked list to add a new node to the end of the list
    # Space Complexity: O(1), because the variables used here is a constant
    def add_last(value)
      return @head = Node.new(value) if @head.nil?
      
      pointer = @head
      while pointer.next
        pointer = pointer.next 
      end
      
      add_node = Node.new(value)
      pointer.next = add_node
      return @head
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n), because it needs to loop thru all linked list to find out the length of the linked list
    # Space Complexity: O(1), because the variables used here is a constant
    def length
      count = 0
      pointer = @head
      while pointer
        count += 1
        pointer = pointer.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to get the data for input index
    # Space Complexity: O(1), because the variables used here is a constant
    def get_at_index(index)
      count = 0
      pointer = @head
      while pointer
        return pointer.data if count == index
        pointer = pointer.next
        count += 1
      end
      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def visit
      raise NotImplementedError
    end

    # method to delete the first node found with specified value
    # Time Complexity: ?
    # Space Complexity: ?
    def delete(value)
      raise NotImplementedError
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      raise NotImplementedError
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      raise NotImplementedError
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
