
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil) # if next_node is not included in argument, default value is nil
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
    # Space Complexity: O(1) ?
    def add_first(value)
      # first node is head. Assign the @head to be the new node and HAVE to set the next_node to be the old head
      @head = Node.new(value, @head)

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
    # Time Complexity: O(n) - traversing through all of the nodes
    # Space Complexity: O(1)
    def find_max
      # what if there's no nodes/empty list? return nil?
      return nil if @head.nil?

      max = @head.data
      current = @head
      until current.nil?
        max = [max, current.data].max
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
        min = current.data if current.data < min
        current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      count = 0
      current = @head

      until current.nil?
        count += 1
        # move the pointer to the next node
        current = current.next
      end

      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value or if the list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if self.length < index || @head.nil?

      # need to consider edge case where index == 0, return @head.data
      current = @head
      count = 0
      until count == index
        count += 1
        current = current.next
      end

      # count is equal to index
      return current.data

    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      # what happens if linked list is empty?

      return nil if @head.nil?

      current = @head
      until current.nil?
        puts current.data
        current = current.next
      end

    end

    # method to delete the first node found with specified value
    # Time Complexity: ?
    # Space Complexity: ?
    def delete(value)
      # what if the list is empty?
      # return if @head.nil?

      if @head.nil?
        # deletion on an empty list is a no-op
        return
      else # list is not empty
        # check if the value to be deleted is the first node
        # if it is, reassign the head to be the next node
        if @head.data == value
          @head = @head.next
          # return
        else # value to be deleted is not the first node

          current = @head
             # increment the current up until the next node's data is the value to be deleted
          until current.next.data == value
            current = current.next
          end
             # the next node's data is the value to be deleted
             # so we change the reference to be the one after the next
          current.next = current.next.next
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1) - we're not making any new linked list, doing it in place
    def reverse
      # in place or can we make a new linked list?
      # in case of empty list, return nil?
      # in case of 1 item list, return itself?
      return nil if @head.nil?
      return @head if self.length == 1
      # pseudocode

      # option 2: (in-place) swap the first and the last node, keep going until you hit the middle
      prev = nil
      current = @head
      until current.nil?
        temp = current.next
        # arrow switching,                                                                                                                      reassign the next node as the one prior,
        current.next = prev
        # move prev and current one step over
        prev = current
        current = temp
      end
      @head = prev
      return current

    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # If there are two middle nodes, return the second middle node.
    # return nil if list is empty
    # Time Complexity: O(1/2n) == O(n)
    # Space Complexity: ?
    def find_middle_value
      # what's the middle value of an even list?
      return nil if @head.nil?

      index = self.length.odd? ? length/2 : (length + 1)/2
      # p index

      if self.length == 1
        return @head.data
      else
        count = 0
        current = @head
        until count == index
          count += 1
          current = current.next
        end

        return current.data
      end

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


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_first
      return nil if @head.nil?

      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)
      if @head.nil?
        self.add_first(value)
      else
        current = @head
        until current.next.nil?
          current = current.next
        end

        # at the last node before the nil
        current.next = Node.new(value)
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?

      # traversing to last node
      current = @head
      until current.next.nil?
        current = current.next
      end

      return current.data
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
