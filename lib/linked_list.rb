
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
      new_first = Node.new(value)
      new_first.next = @head
      @head = new_first
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      current = @head
      until current.nil?
        return true if current.data == value
        current = current.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?
      maximum = @head.data
      current = @head
      while ! current.nil?
        if current.data > maximum
          maximum = current.data
        end
        current = current.next
      end
      return maximum
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?
      minimum = @head.data
      current = @head
      while current.next != nil
        if current.data < minimum
          minimum = current.data
        end
        current = current.next
      end
      return minimum
    end


    # Additional Exercises
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      if @head.nil?
        add_first(value)
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
      until current.nil?
        count += 1
        current = current.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(m)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?
      current = @head
      index.times do
        current.nil? ? nil : current = current.next
      end
      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      current = @head
      until current.nil?
        print(current.data)
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return if @head.nil?
      if @head.data == value
        @head = @head.next
      end

      current = @head
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
      return if @head.nil? || @head.next.nil?

      back = @head
      front = back.next
      until front.nil?
        back = back.next
        front = front.next
        if !front.nil?
          front = front.next
        end
      end
      return back.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      index = self.length - n
      get_at_index(index)
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(1)
    # Space Complexity: O(n)
    def has_cycle
      return false if @head.nil? || @head.next.nil?

      back = @head
      front = back.next
      until front.nil?
        back = back.next
        front = front.next
        if !front.nil?
          front = front.next
        end
        return true if back == front
      end
      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      return if @head.nil?
      new_node = Node.new(value)
      current = @head
      until current.next.nil?
        if value > current.data && value < current.next.data
          new_node.next = current.next
          current.next = new_node
          current = current.next
        else
          current = current.next
        end
      end
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
