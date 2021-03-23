
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
    # Time Complexity: O(1) - creating 1 node
    # Space Complexity: O(1) - adding 1 node
    def add_first(value)
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n) - potentially have to loop through n nodes to find value
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil?
      current_node = @head
      until current_node.data == value 
        return false if current_node.next.nil?
        current_node = current_node.next
      end
      return true
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) - have to loop through all nodes to confirm max value
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?

      max_value = @head.data
      current_node = @head
      until current_node.nil?
        max_value = [max_value, current_node.data].max
        current_node = current_node.next
      end

      return max_value

    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n) - have to loop through all nodes to confirm max value
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?

      min_value = @head.data
      current_node = @head
      until current_node.nil?
        min_value = [min_value, current_node.data].min
        current_node = current_node.next
      end

      return min_value
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1) - grabbing first element regardless of length of list
    # Space Complexity: O(1)
    def get_first
      return @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n) - have to loop through all elements and add node to the end
    # Space Complexity: O(1)
    def add_last(value)
      if @head
        current_node = @head
        until current_node.next.nil?
          current_node = current_node.next
        end 
        current_node.next = Node.new(value)
      else
        add_first(value)
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n) - have to loop through entire list to get length
    # Space Complexity: O(1)
    def length
      count = 0
      current_node = @head
      until current_node.nil?
        count += 1
        current_node = current_node.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n) - potentially could loop through each node if the requested index is last
    # Space Complexity: O(1)
    def get_at_index(index)
      count = 0
      current_node = @head
      until current_node.nil? || count == index 
        count += 1
        current_node = current_node.next
      end
      return current_node.nil? ? current_node : current_node.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n) - Loop through n nodes
    # Space Complexity: O(1)
    def visit
      return nil if @head.nil?

      current_node = @head
      until current_node.nil?
        puts current_node.data
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n) - potentially have to loop through entire list to find the specified value to delete. 
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      if @head.data == value
        @head = @head.next
      else 
        previous_node = @head
        until previous_node.next.data == value
          previous_node = previous_node.next
        end
        previous_node.next = previous_node.next.next
      end
    end

  
    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n) - have to loop through each node and change its reference
    # Space Complexity: O(1) - not creating a new list, just changing the references
    def reverse
      return if @head.nil? || @head.next.nil? # if list is empty or has 1 element

      current = @head
      next_node = @head.next
      current.next = nil
      
      until next_node.nil?
        previous = current
        current = next_node
        next_node = next_node.next

        current.next = previous

      end
      current.next = previous
      @head = current
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n) - have to loop through each element, would be O(1) if tail is kept track. 
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?
      current_node = @head
      until current_node.next.nil?
        current_node = current_node.next
      end

      return current_node.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list, if length is even, returns the second value of the two middle ones
    # Time Complexity: O(n) - using two pointer method, have to loop through at half the list of n size to determine the middle. 
    # Space Complexity: O(1)
    def find_middle_value

      return nil if @head.nil?

      s_ptr = @head
      f_ptr = @head
      until f_ptr.nil? # if this is true, the list is odd 
        if f_ptr.next.nil?
          return s_ptr.data
        end
        s_ptr = s_ptr.next
        f_ptr = f_ptr.next.next
      end
      return s_ptr.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n) - potentially have to traverse the entire list
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if @head.nil?
      return nil if n >= length || n < 0
      target = length - n - 1
      current_node = @head
    
      target.times do 
        current_node = current_node.next
      end
      return current_node.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n) - This would linearly scale with size of the list. 
    # Space Complexity: O(1) - no added space complexity 
    def has_cycle
      # use floyd's cycle finding algorithm: https://stackoverflow.com/questions/2663115/how-to-detect-a-loop-in-a-linked-listf
      # Fast and Slow pointer
      # option 2: could also use a hash to keep track of visited values. 
      return false if @head.nil?
      fast = @head
      slow = @head

      while true
        slow = slow.next

        if fast.next != nil
          fast = fast.next.next 
        else
          return false
        end

        return false if fast == nil || slow == nil

        return true if fast == slow

      end
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      # if value is less or equal put in front, if value is greater than move to the next node. 
      # have to keep track of current node and next node

      # empty list
      if @head.nil?
        @head = Node.new(value)
        return
      end

      # node is smaller than the first
      if value < @head.data 
        @head = Node.new(value, @head)
        return
      end
      previous = @head
      current = previous.next

      # node in the middle
      until current.nil?
        if value <= current.data 
          previous.next = Node.new(value, current)
          return
        else
          previous = previous.next
          current = current.next
        end
      end    

      # node is larger than the last
      previous.next = Node.new(value)
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
