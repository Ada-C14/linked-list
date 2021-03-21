
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
    # Space Complexity: O(1) ??????
    def add_first(value)
      to_add = Node.new(value, next_node = @head)
      @head = to_add
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      current = @head

      until current == nil
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
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?

      current = @head
      max = current

      until current == nil
        max = current if current.data > max.data
        current = current.next
      end

      return max.data
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?

      current = @head
      min = current

      until current == nil
        min = current if current.data < min.data
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
      @head ? @head.data : nil
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      to_insert = Node.new(value)

      if !@head
        @head = to_insert
      else
        current = @head
        until current.next == nil
          current = current.next
        end
        current.next = to_insert
      end

    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      current = @head
      length = 0

      until current == nil
        length += 1
        current = current.next
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      count = 0
      current = @head

      until !current
        return current.data if index == count
        current = current.next
        count += 1
      end

      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      current = @head
      
      while current
        print(current.data)
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      # empty list
      return if !@head

      if @head.data == value
        @head = @head.next
      else
        current = @head
        previous = @head
  
        # or current.nil? - node to delete not in list?
        until current.data == value
          previous = current
          current = current.next
        end
  
        previous.next = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      i = nil
      current = @head
      
      until !current
        j = current.next
        current.next = i
        i = current
        current = j
      end

      @head = i
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      return @head unless @head

      current = @head
      until !current.next
        current = current.next
      end

      return current.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      return nil if !@head
      i = @head
      j = @head
      
      while j && j.next
        i = i.next
        j = j.next.next
      end
      
      return i.data
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
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      @head = Node.new(value) if !@head

      current = @head
      previous = current

      if current.data > value
        @head = Node.new(value, next_node = previous)
      else
        until !current
          if current.data > value
            to_add = Node.new(value, next_node = current)
            previous.next = to_add
            return
          end
          previous = current
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
