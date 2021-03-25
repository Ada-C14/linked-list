
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
      return false if @head.nil?
      while !current.nil?

        return true if current.data == value
        current = current.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      max = -1 / 0.0
      current = @head
      while !current.nil? || current.next != nil
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
      min = 1 / 0.0

      current = @head
      while !current.nil?

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
      return nil if @head.nil?
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      @head.data = value if @head.nil?
      current = @head
      while current.next != nil
        current = current.next
      end
      current.next = Node.new(value)
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      return 0 if @head.nil?
      count = 1
      current = @head
      while current.next != nil
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
      current_index = 0

      current = @head
      while current_index != index
        return nil if current.nil? || current.next.nil?
        current = current.next
        current_index += 1
      end
      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      return nil if @head.nil?
      current = @head
      while current != nil || current.next != nil 
        print current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?
      current = @head
      if @head.data == value
        @head = @head.next
      end

      while current.next != nil
        if current.next.data == value
          current.next = current.next.next
        end
        current = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      return nil if @head.nil?
      return if @head.next.nil?

      slow = @head
      slow.next = nil
      fast = @head.next
      temp = fast.next

      while fast.next != nil
        fast.next = slow
        slow = fast
        fast = temp
        temp = temp.next
      end

      fast.next = slow
      @head = fast
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      return nil if @head == nil
      return nil if has_cycle()
      current = @head
      while current.next != nil
        current = current.next
      end
      return current.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      fast = @head
      slow = @head

      while fast.next != nil
        slow = slow.next
        fast = fast.next.next
      end

      return slow
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if has_cycle()
      return nil if @head.nil?
      fast = @head
      slow = @head
      
      n.times do
        return nil if fast.next == nil
        fast = fast.next
      end

      while fast.next != nil
        fast = fast.next
        slow = slow.next
      end

      return slow.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def has_cycle
      return false if @head.nil?

      fast = @head
      slow = @head

      while fast != slow
        return false if fast.next.nil?
        fast = fast.next.next
        slow = slow.next
      end

      return true
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      @head.data = value if @head.nil?
      current = @head

      while current.next.data < value
        current = current.next
      end

      temp = current.next
      current.next = Node.new(value,temp)
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
