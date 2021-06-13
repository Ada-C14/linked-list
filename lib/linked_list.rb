
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
    # Time Complexity: O(1), because the new node is always add at the beginning of the lilnked list
    # Space Complexity: O(1), because the variables used here is a constant 
    def add_first(value)
      return @head = Node.new(value) if @head.nil?
      add_node = Node.new(value)
      add_node.next = @head
      @head = add_node
      return @head
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to find the answer
    # Space Complexity: O(1), because the variables used here is a constant
    def search(value)
      pointer = @head
      while pointer
        return true if pointer.data == value
        pointer = pointer.next
      end
      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), because it needs to loop thru all linked list to find the max value
    # Space Complexity: O(1), because the variables used here is a constant
    def find_max
      return nil if @head.nil?
      max = @head.data
      pointer = @head
      while pointer.next
        pointer = pointer.next
        pointer.data > max ? max = pointer.data : max
      end
      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n), because it needs to loop thru all linked list to find the min value
    # Space Complexity: O(1), because the variables used here is a constant
    def find_min
      return nil if @head.nil?
      min = @head.data
      pointer = @head
      while pointer.next
        pointer = pointer.next
        pointer.data < min ? min = pointer.data : min
      end
      return min
    end

    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1), because the first node is always at the beginning of the lilnked list
    # Space Complexity: O(1), no extra variable is used in this case
    def get_first
      return @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n), because it needs to loop thru all linked list to add a new node to the end of the list
    # Space Complexity: O(1), because the variables used here is a constant
    def add_last(value)
      return @head = Node.new(value) if @head.nil?
      
      pointer = @head
      while pointer.next
        pointer = pointer.next 
      end
      
      add_node = Node.new(value)
      pointer.next = add_node
      return @head
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n), because it needs to loop thru all linked list to find out the length of the linked list
    # Space Complexity: O(1), because the variables used here is a constant
    def length
      count = 0
      pointer = @head
      while pointer
        count += 1
        pointer = pointer.next
      end
      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to get the data for input index
    # Space Complexity: O(1), because the variables used here is a constant
    def get_at_index(index)
      count = 0
      pointer = @head
      while pointer
        return pointer.data if count == index
        pointer = pointer.next
        count += 1
      end
      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n), because it has to loop thru all linked list to print the values
    # Space Complexity: O(n)/O(1), because add_value depends on the length of the linked list, it would be O(n); 
    #                         unless we don't need all_value, it would be O(1) for just print out the data.
    def visit
      all_value = []
      return nil if @head.nil?
      pointer = @head
      while pointer
        puts pointer.data
        all_value.push(pointer.data)
        pointer = pointer.next
      end
      return all_value
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to find the value
    # Space Complexity: O(1), because the variables used here is a constant
    def delete(value)
      if @head.nil?
        # do nothing
      elsif @head.data == value
        @head = @head.next
      else
        pointer = @head
        while pointer 
          if pointer.next.data == value
            pointer.next = pointer.next.next
            break
          else
            pointer = pointer.next
          end
        end
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n), because it has to loop thru all linked list to do the reverse
    # Space Complexity: O(1), because the variables used here is a constant
    def reverse
      return @head if @head.nil? || @head.next.nil?
      
      pointer = @head
      previous = nil
      while pointer
        temp = pointer.next
        pointer.next = previous
        previous = pointer
        pointer = temp
      end

      @head = previous
      return @head      
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n), because it has to loop thru all linked list to get the last data
    # Space Complexity: O(1), because the variables used here is a constant
    def get_last
      return nil if @head.nil?
      
      pointer = @head
      while pointer.next
        pointer = pointer.next 
      end
      
      return pointer.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n), because it has to loop thru half of the linked list to get the middle value, so O(n/2) is to be O(n)
    # Space Complexity: O(1), because the variables used here is a constant
    def find_middle_value
      return nil if @head.nil?
      return @head.data if @head.next.nil?

      slow = @head
      fast = @head.next

      while fast
        slow = slow.next
        fast = fast.next
        fast = fast.next if fast
      end

      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n), because it has to loop thru all linked list to get the last data to find nth from the end
    # Space Complexity: O(1), because the variables used here is a constant
    def find_nth_from_end(n)
      last = @head
      nth = nil
      count = 0
      while last
        if count == n
          nth = @head
        elsif count > n
          nth = nth.next
        end
        count += 1
        last = last.next
      end
      return nil if nth.nil?
      return nth.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to get the result
    # Space Complexity: O(1), because the variables used here is a constant
    def has_cycle
      return false if @head.nil? || @head.next.nil?

      slow = @head
      fast = @head
      while fast
        slow = slow.next
        fast = fast.next
        fast = fast.next if fast
        return true if fast == slow
      end
      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n), because the worst case scenario is to loop thru all linked list to insert a value in the sorted list
    # Space Complexity: O(1), because the variables used here is a constant
    def insert_ascending(value)
      return @head = Node.new(value) if @head.nil?

      add_node = Node.new(value)
      pointer = @head
      if value < @head.data
        add_node.next = @head
        @head = add_node
      else
        while pointer
          if value < pointer.next.data
            add_node.next = pointer.next
            pointer.next = add_node
            break
          end
          pointer = pointer.next
        end
      end

      return @head
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
