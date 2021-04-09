
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
    # Time Complexity: O(1), will take same amount of time regardless of the length of the list
    # Does not have to perform any additional operations to move the existing nodes
    # Space Complexity: O(1), needs space for one new node
    # Does not need any additional space for existing nodes as they are unaffected
    # Would be O(n) where n is the size of the value being saved to the new node,
    # but if all nodes are integers and therefore comparable sizes, n is constant
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n), in the worst case scenario needs to check every single
    # node in a linked list of n length
    # Space Complexity: O(n), just needs to save one node to a variable
    def search(value)
      current = @head
      while current
        return true if current.data == value
        current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n). Will need to check every node in linked list of n length
    # Space Complexity: O(1). Will need two running variables regardless of length of list
    def find_max
      return nil if @head.nil?
      current = @head
      max = @head.data

      while current
        max = current.data > max ? current.data : max
        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n). Will need to check every node in linked list of n length
    # Space Complexity: O(1). Will need two running variables regardless of length of list
    def find_min
      return nil if @head.nil?
      current = @head
      max = @head.data

      while current
        max = current.data < max ? current.data : max
        current = current.next
      end

      return max
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1), checking the head node takes one operation
    # Space Complexity: O(1) assuming all nodes have comparable data sizes, same size return value regardless
    def get_first
      @head.nil? ? nil : @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n), will need to iterate over entire linked list of length n
    # Space Complexity: O(1)
    def add_last(value)
      if @head.nil?
        @head = Node.new(value)
      else
        current = @head
        while current.next
          current = current.next
        end
        new_node = Node.new(value)
        current.next = new_node
      end
    end

    # method that returns the length of the singly linked list
    # Time Complexity: O(n), will need to iterate over entire linked list of length n
    # Space Complexity: O(1)
    def length
      return 0 if @head == nil

      count = 1
      current = @head

      while current.next
        count += 1
        current = current.next
      end

      return count
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n), will increase linearly with the size of the index being sought,
    # will potentially have to iterate through entire linked list if item sought is last or does not exist
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if @head.nil?
      
      counter = 0
      current = @head

      until counter == index
        return nil if current.nil?
        counter += 1
        current = current.next
      end

      return current.data
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n), will have to check each node in linked list of length n
    # Space Complexity: O(n), will have to store values of n number of nodes in linked list of length n
    def visit
      values = []
      current = @head

      while current
        values.push(current.data)
        current = current.next
      end

      return values
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n), has to iterate over linked list of length n to find the node to delete
    # Space Complexity: O(1)
    def delete(value)
      return if @head.nil?
      @head = @head.next if @head.data == value

      current = @head
      until current.next.nil? || current.next.data == value
        current = current.next
      end

      to_delete = current.next
      if to_delete
        current.next = to_delete.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n), n = length of linked list
    # Space Complexity: O(1)
    def reverse
      # assign three pointers: one to head, one to head.next, one to head.next.next
      p1 = @head
      p2 = p1.next
      p3 = p2.next

      # tell head to point to nil
      p1.next = nil

      # point p2 to p1 and move all pointers forward
      while p3
        p2.next = p1
        p1 = p2
        p2 = p3
        p3 = p3.next
      end

      # last link
      p2.next = p1
    
      # once p3 is nil, p2 is pointing at the (former) tail, now head
      @head = p2
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n), n = length of linked list
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?
      
      current = @head
      while current.next
        current = current.next
      end

      return current.data
    end
  
    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n), n = length of linked list
    # Space Complexity: O(1)
    def find_middle_value
      # two pointers, one moving twice every iteration, the other moving once
      slow = @head
      fast = @head

      while fast.next
        fast = fast.next
        slow = slow.next
        if fast.next
          fast = fast.next
        else
          return slow.data
        end
      end

      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n), n = length of linked list
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      count = 0
      lead = @head
      tail = @head

      until count == n
        return nil if lead.nil?
        lead = lead.next
        count += 1
      end

      return nil if lead.nil?

      until lead.next.nil?
        tail = tail.next
        lead = lead.next
      end

      return tail.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: O(n), n = length of linked list
    # Space Complexity: O(n), n = number of nodes (length of linked list)
    def has_cycle
      already_seen = []
      current = @head

      while current
        return true if already_seen.include? current
        
        already_seen.push(current)
        current = current.next
      end

      return false
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      if @head.nil? || value < @head.data
        self.add_first(value)
        return
      end

      current = @head

      while current.next
        if current.data <= value && value <= current.next.data
          new_node = Node.new(value)
          new_node.next = current.next
          current.next = new_node
          return
        else
          current = current.next
        end
      end

      if value >= current.data
        current.next = Node.new(value)
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
