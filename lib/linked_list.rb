
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
      # raise NotImplementedError
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      # raise NotImplementedError
      current = @head

      until current == nil
        if current.data == value
          return true
        else
          current = current.next
        end
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      # raise NotImplementedError
      return nil if @head.nil?

      max_value = @head.data
      current = @head

      until current == nil
        if current.data > max_value
          max_value = current.data
        end
        current = current.next
      end

      return max_value

    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: ?
    # Space Complexity: ?
    def find_min
      # raise NotImplementedError
      return nil if @head.nil?

      min_value = @head.data
      current = @head

      until current == nil
        if current.data < min_value
          min_value = current.data
        end
        current = current.next
      end

      return min_value

    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_first
      # raise NotImplementedError
      return @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      # raise NotImplementedError
      if @head.nil?
        @head = Node.new(value)
      else
        current = @head
        until current.next.nil?
          current = current.next
        end
        current.next = Node.new(value)
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def length
      # raise NotImplementedError
      count = 0
      current = @head
      until current.nil?
        current = current.next
        count += 1
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: ?
    # Space Complexity: ?
    def get_at_index(index)
      # raise NotImplementedError
      counter = 0
      current = @head
      until current.nil?
        if index == counter
          return current.data
        else
          counter += 1
          current = current.next
        end
      end
    end

    # method to print all the values in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def visit
      # raise NotImplementedError
      return nil if @head.nil?

      current = @head
      until current.nil?
        puts current.data
      end

    end

    # method to delete the first node found with specified value
    # Time Complexity: ?
    # Space Complexity: ?
    def delete(value)
      # raise NotImplementedError
      return nil if @head.nil?

      if @head.data == value
        @head = @head.next
      else
        current = @head
        until current.next.data == value
          current = current.next
        end
        current.next = current.next.next
      end

    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      # raise NotImplementedError
      prev = nil
      current = @head

      until current.nil?
        temp = 
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      # raise NotImplementedError
      return nil if @head.nil?

      current = @head
      until current.next.nil?
        current = current.next
      end

      return current.data
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
