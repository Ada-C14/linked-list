
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
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      current = @head
      while current != nil
        return true if current.data == value

        current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?

      max = @head.data
      current = @head
      while current != nil
        max = current.data if current.data > max
        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?

      min = @head.data
      current = @head
      while current != nil
        min = current.data if current.data < min
        current = current.next
      end

      return min
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
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
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      count = 0
      current = @head
      while current != nil
        count += 1
        current = current.next
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

      current = @head
      index.times do
        return nil if current.nil?

        current = current.next
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      return nil if @head.nil?

      current = @head
      while current != nil
        print current.data
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return if @head.nil?

      if @head.data == value
        @head = @head.next
        return
      end

      current = @head
      until current.next.nil?
        if current.next.data == value
          current.next = current.next.next
          return
        end
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      return if @head.nil? || @head.next.nil?

      current = @head
      previous = nil
      until current.nil?
        temp = current.next
        current.next = previous
        previous = current
        current = temp
      end
      
      @head = previous
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?

      current = @head
      until current.next.nil?
        current = current.next
      end

      return current.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      if @head.nil?
        return nil
      else
        slow = @head
        fast = @head.next
        while fast != nil
          slow = slow.next
          fast = fast.next
          fast = fast.next if fast != nil
        end

        return slow
      end
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if @head.nil?

      current = @head
      n.times do
        current = current.next
        return nil if current.nil?
      end

      trailing_current = @head
      until current.next.nil?
        current = current.next
        trailing_current = trailing_current.next
      end

      return trailing_current.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def has_cycle
      if @head.nil? || @head.next.nil?
        return false
      end

      slow = @head
      fast = @head
      while fast != nil
        slow = slow.next
        fast = fast.next
        fast = fast.next if fast != nil
        
        return true if fast == slow
      end

      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      if @head.nil?
        @head = Node.new(value)
        return
      end
      
      current = @head
      while current.next != nil && current.next.data > value
        current = current.next
      end
      
      current.next = Node.new(value, current.next)
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
