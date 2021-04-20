
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
      new_node = Node.new(value, @head)
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def search(value)
      return false if @head == nil
      current = @head
      while current
        if current.data == value
          return true
        end
        current = current.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def find_max
      return nil if @head == nil
      current = @head
      max = current.data
      current = current.next
      while current 
        if current.data > max
          max = current.data
        end
        current = current.next
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def find_min
      return nil if @head == nil
      current = @head
      min = current.data
      current = current.next
      while current
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
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      if @head
        return @head.data
      else
        return nil
      end
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def add_last(value)
      new_node = Node.new(value)
      if @head == nil
        @head = new_node
        return
      end
      current = @head
      while current.next
        current = current.next
      end
      current.next = new_node
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def length
      return 0 if @head == nil
      current = @head
      count = 0
      until current.nil?
        count += 1
        current = current.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def get_at_index(index)
      current = @head
      current_index = 0
      if current.nil? || index.nil?
        return nil
      end
      until current_index == index
        current = current.next
        current_index += 1
      end
      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def visit
      current = @head
      while current.next
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head == nil

      if @head.data == value
        @head = @head.next
        return
      end

      current = @head
      while current.next
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
    # Space Complexity: O(n)
    def reverse
      return nil if @head == nil
      current = @head
      prev = nil
      while current
        temp = current.next
        current.next = prev
        prev = current
        current = temp
      end
      @head = prev
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def get_last
      return nil if @head == nil
      
      current = @head
      while current.next != nil
        current = current.next
      end
      return current.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def find_middle_value
      return nil if @head == nil

      slow = @head
      fast = @head.next
      while fast != nil
        slow = slow.next
        fast = fast.next
        if fast != nil
          fast = fast.next
        end
      end
      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def find_nth_from_end(n)
      return nil if @head == nil || self.length < n
      return self.get_last if n == 0
      n = self.length - n
      count = 0
      current = @head
      until count == n - 1 
        if current.next == nil
          return nil
        end
        current = current.next
        count += 1
      end
      return current.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def has_cycle
      slow = @head
      fast = @head.next
      while fast != nil
        slow = slow.next
        fast = fast.next
        if fast == slow
          return true
        end
      end
      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def insert_ascending(value)
      new_node = Node.new(value)
      if @head == nil || @head.data > value
        new_node.next = @head
        @head = new_node
      end
      current = @head
      while current.next && current.next.data < value
        current = current.next
      end
      new_node.next = current.next
      current.next = new_node
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
