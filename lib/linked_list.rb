
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
    # Time Complexity: O(1) Constant time, does not require shifting adjacent elements.
    # Space Complexity: O(1) adding one node,  only uses memory as required for that node.
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil?

      current = @head
      until current.nil?
        return true if current.data == value

        current = current.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) traverse entire list to find max
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?

      max = @head.data
      current = @head

      until current.nil?
        if current.data > max
          max = current.data
        end
        current = current.next
      end
      return max

    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) traverse entire list to find min
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?

      min = @head.data
      current = @head

      until current.nil?
        if current.data < min
          min = current.data
        end
        current = current.next
      end
      return min

    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1) The position of the head is always first, so no traversing needed to find value
    # Space Complexity: O(1)
    def get_first
      return nil if @head.nil?

      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def add_last(value)
      # raise NotImplementedError
      current = @head
      if current.nil?
        @head = Node.new(value)
      else
        current = current.next until current.next.nil?
        current.next = Node.new(value)
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      # raise NotImplementedError
      current = @head
      count = 0
      until current.nil?
        current = current.next
        count += 1
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?

      count = 0
      current = @head
      while count < index
        current.next.nil? ? nil : current = current.next
        count += 1
      end
      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      # raise NotImplementedError
      return nil if @head.nil?

      current = @head
      until current.nil?
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def delete(value)
      # raise NotImplementedError
      return nil if @head.nil?
      # current = @head
      # if current.data == value
      #   @head = current.next
      # else
      #
      # end
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
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      # raise NotImplementedError
      return nil if @head.nil?

      current = @head
      current = current.next until current.next.nil?
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
      current = current.next until current.next.nil?

      current.next = @head # make the last node link to first node
    end
end
