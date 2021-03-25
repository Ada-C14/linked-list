
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
      if @head
        new_node = Node.new(value, @head)
        @head = new_node
      else
        @head = Node.new(value)
      end
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      return false if @head == nil

      current = @head

      until current.nil? 
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
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      return if @head == nil

      current = @head
      max = @head

      until current.nil?
        if current.data > max.data
          max = current
        end

        current = current.next
      end

      return max.data
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
   # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return if @head == nil

      current = @head
      min = @head

      until current.nil?
        if current.data < min.data
          min = current
        end

        current = current.next
      end

      return min.data
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return @head.data if @head
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
      if @head.nil?
        return 0
      else
        count = 0

        current = @head
        until current.nil?
          count += 1
          current = current.next
        end

        return count
      end
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return if @head == nil

      count = 0
      current = @head

      until count == index
        current = current.next
        count += 1
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      return if @head == nil

      current = @head

      until current.nil?
        puts current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return if @head == nil

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
      return if @head == nil

      current = @head
      previous = nil

      until current.nil?
        # save state
        temp = current.next
        # update linked list
        current.next = previous
        # move to next node
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
      return if @head == nil

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
      return if @head == nil

      slow = @head
      fast = @head.next

      until fast.nil?
        slow = slow.next
        fast = fast.next
        unless fast.nil?
          fast = fast.next
        end
      end

      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return if @head == nil

      count = 0

      current = @head
      trailing_current = nil

      until count == n || current.next.nil?
        current = current.next
        count += 1
      end

      if count == n
        trailing_current = @head
      end

      until current.next.nil?
        current = current.next
        trailing_current = trailing_current.next
      end

      return trailing_current.data if trailing_current
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def has_cycle
      return if @head == nil

      slow = @head
      fast = @head.next

      until fast.nil?
        slow = slow.next
        fast = fast.next
        unless fast.nil?
          fast = fast.next
        end

        if fast == slow
          return true
        end
      end

      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      return if @head == nil

      current = @head

      until current.nil?
        if current.next.data > value
          current.next = Node.new(value, current.next.next)
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
