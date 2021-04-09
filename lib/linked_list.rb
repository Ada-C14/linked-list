
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
      node = Node.new(value, @head) #head is nil
      @head = node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      current_node = @head

      while current_node
        if current_node.data == value
          return true
        else
          current_node = current_node.next
        end
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      current_node = @head
      return if @head.nil?
      max = current_node.data

      while current_node.next
        if current_node.next.data > max
          max = current_node.next.data 
        end
        current_node = current_node.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      current_node = @head
      return if @head.nil?
      min = current_node.data

      while current_node.next
        if current_node.next.data < min
          min = current_node.next.data 
        end
        current_node = current_node.next
      end

      return min
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      @head&.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time complexity - O(n)
    # Space complexity - O(1)
    def add_last(value)
      return add_first(value) if @head.nil? #if list is empty, adding to the first of the list is the same as adding to the end of the list

      node = @head
      while !node.next.nil? #when next is nil, we are at the end of the list
        next_node = node.next
        node = next_node
      end
  
      node.next = Node.new(value)
    end

    # method that returns the length of the singly linked list
    # Time complexity - O(n)
    # Space complexity - O(1)
    def length
      count = 0
      node = @head
  
      while !node.nil?
        count += 1
        next_node = node.next
        node = next_node
      end
      count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      count = 0
      node = @head
      while count < index
        return if node.nil?
        node = node.next
        count += 1
      end
  
      node.data
    end

    # method to print all the values in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def visit
      raise NotImplementedError
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return if @head.nil?
      current_node = @head

      if current.data == value
        @head = current.next
      else
        while (current.next != nil) && (current.next.data != value)
          current = current.next
        end
        unless current.next == nil
          current.next =current.next.next
        end
      end
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
      return if @head.nil?

      node = @head #node is the current object
      while !node.next.nil? #iterating through objects until node.next is nil
        # next_node = node.next
        node = node.next
      end
      node.data
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
