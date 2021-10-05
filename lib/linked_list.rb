
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
    # Time Complexity: O(n)
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
    # Time Complexity: O(n)
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
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return nil if @head.nil?
      puts @head.data
      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      if @head.nil?
        @head = Node.new(value)
        return @head
      end

      current = @head

      until current.next.nil?
        current = current.next
      end

      current.next = Node.new(value)
      return @had
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

      current.data
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      return 0 if @head.nil?

      count = 1
      current = @head

      until current.next.nil?
        current = current.next
        count += 1
      end

      count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def get_at_index(index)
      return nil if @head.nil?

      if index == 0
        return @head.data
      else
        current = @head
        current_index = 0

        until current.next.nil?
          current = current.next
          current_index += 1

          if current_index == index
            return current.data
          end
        end

        return nil

      end
    end



    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def visit
      values = []

      return nil if @head.nil?

      current = @head

      until current.next.nil?
        values << current.data
        current = current.next
      end

      values
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      return nil if @head.nil?

      current = @head

      until current.next.nil?
        if current.next.data == value
          current.next = current.next.next
          return @head
        end
      end

      puts "value not found!"
      
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      pre = nil
      current = @head

      until current.nil?
        post = current.next
        current.next = pre
        pre = current
        current = post
      end

      @head = pre
      return @head
    end

  
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n log (n))
    # Space Complexity: O(1)
    def find_middle_value
      length = @list.length
      @list.get_at_index(length/2)
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n^2)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      length = @list.length
      @list.get_at_index(length - n)
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def has_cycle
      visited = {}
      current = @head

      until current.nil?
        if visited[current]
          return true
        end

        visited[current] = true

        current = current.next
      end

      false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(num)
      if !num.is_a? Integer
        raise ArgumentError, "value should be a number"
      end

      new_value = Node.new(num)

      if @head.nil?
        @head = new_value
        return @head
      end

      min = Node.new(-Float::INFINITY)
      max = @head

      while max
        
        if new_value.data > min.data && new_value.data < max.data

          min.next = new_value
          new_value.next = max

          return @head
        end

        min = max
        max = max.next
      end

      if new_value.data > max.data
        max.next = new_value
        return @head
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


puts "test ascending"
@list = LinkedList.new
@list.add_first(3)
@list.add_first(1)

@list.insert_ascending(2)

print @list.get_at_index(2)
