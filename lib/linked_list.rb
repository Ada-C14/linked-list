
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
  # Time Complexity: O(1) - insertion of node without needing to search or shift list like in array (only at front)
  # Space Complexity: O(1) - you are always adding only one new piece of memory for the new node.
  def add_first(value)
    new_head = Node.new(value)
    new_head.next = @head
    @head = new_head
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n) - worst case is that you search every node of the list
  # Space Complexity: O(1) - only one variable, cur, is created for every call 
  def search(value)
    cur = @head
      while(cur)
        return true if cur.data == value
        cur = cur.next
      end
    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) - you always search every node of the list
  # Space Complexity: O(1) - only two variables, cur and max_val, is created for every call 
  def find_max

    return nil if !@head

    max_val = @head.data
    cur = @head

    while(cur)
      # only update if cur value is larger
      max_val = cur.data if cur.data > max_val 
      cur = cur.next
    end

    return max_val
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n) - you always search every node of the list
  # Space Complexity: O(1) - only two variables, cur and min_val, is created for every call 
  def find_min
    return nil if !@head

    min_val = @head.data
    cur = @head

    while(cur)
      min_val = cur.data if cur.data < min_val
      cur = cur.next
    end

    return min_val
  end


  # Additional Exercises 
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1) - You always know where the head is and don't need to do any traveling.
  # Space Complexity: O(1) - no new memory, let alone variables, have been created
  def get_first
    return !@head ? nil : @head.data
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n) - you have to travel all nodes of list before adding the node, which is an O(1) operation
  # Space Complexity: O(1) - only one node added per call, other than tracking variable cur
  def add_last(value)
    if !@head

      @head = Node.new(value)
    else
      cur = @head

      while(cur.next)
        cur = cur.next
      end

      cur.next = Node.new(value)
    end
  end

  # method that returns the length of the singly linked list
  # Time Complexity: O(n) - you always search every node of the list
  # Space Complexity: O(1) - only variables cur and length are created for every call 
  def length
    length = 0

    cur = @head

    while(cur)
      length += 1
      cur = cur.next
    end

    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n) - worst case is that you search every node of the list
  # Space Complexity: O(1) - only variables cur and list_index are created for every call 
  def get_at_index(index)
    
    return nil if !@head

    list_index = 0

    cur = @head

    while (cur)
      return cur.data if index == list_index
      cur = cur.next
      list_index += 1
    end

    return nil
  end


  # method to print all the values in the linked list
  # Time Complexity: O(n) - you always search every node of the list
  # Space Complexity: O(1) - only variable cur created for every call 
  def visit

    # do nothing if empty
    if @head

      # fencepost
      print @head.data
      
      # start at next node
      cur = @head.next

      # print all non-nil values with space preceding
      while(cur)
        print " #{cur.data}"
        cur = cur.next
      end
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n) - worst case is that you search every node of the list before deleting (or not finding the value)
  # Space Complexity: O(1) - only variable cur created for every call, and you actually lose one node in the list without needing to shift elements
  def delete(value)
    if @head

      if @head.data == value
        @head = @head.next
      else
        cur = @head
        
        # stop at last node or node before matching node
        while (cur.next)

          if (cur.next.data == value )
            cur.next = cur.next.next
            break
          end

          cur = cur.next
        end 
        
      end

    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n) - you must go through every node in the list
  # Space Complexity: O(1) - even though nodes are added to new_list, they are actually
  #                          existing nodes being removed from the current list - aside
  #                          from tracking variable 'cur', this means amount of memory
  #                          used is not increasing or decreasing ( at least for this implementation)
  def reverse
    # ignore empty and single node lists
    if @head && @head.next
      new_list = nil # don't need to start a whole new LinkedList
      
      # pull from head until list is empty
      while (@head)

        # save original head
        add_node = @head

        # delete original head from current list
        @head = @head.next

        # add original head to head of new_list AS A NODE
        add_node.next = new_list
        new_list = add_node
      end

      # set to new list
      @head = new_list
    end
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n) - you have to travel all nodes of list to find last node
  # Space Complexity: O(1) - only tracking variable cur for every call
  def get_last
    return nil if !@head

    cur = @head

    while(cur.next)
      cur = cur.next
    end
    
    return cur.data
    
  end

  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity: O(n) - you must go through every node in the list once at two nodes per 'hop', which takes 0.5N time, 
  #                         where N is the number of nodes in the list.
  # Space Complexity: O(1) - only two tracking variables called  
  def find_middle_value
    
    if @head && (@head.next.nil? || @head.next.next.nil?) # check for single and two node list

      return @head.data
    elsif @head && @head.next

      cur_fast = @head # travels twice as fast to end
      cur_slow = @head # will reach middle value when cur_fast reaches end

      while(cur_fast && (cur_fast.next && cur_fast.next.next))
        cur_fast = cur_fast.next.next # hop two nodes
        cur_slow = cur_slow.next # hop one node
      end

      return cur_slow.data
    end
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n) - you must go through every node in the list twice, as you are calling
  #                         two O(n) methods sequentially.
  # Space Complexity: O(1) - other than tracking variables, the two methods called don't introduce  new memory dependent on input. 
  def find_nth_from_end(n)
    index = self.length - 1 - n
    
    return self.get_at_index(index)
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n) on average? - function depends on how long it takes cur_fast to reach end, which is O(n),
  #                                     or catch back up to cur_slow in a cycle, which I THINK takes on average 2 cycles
  #                                     of the entire list for worst case cycle (last node's next node is 'head')
  # Space Complexity: O(1) - other than tracking variables, no new memory introduced
  def has_cycle

    return false if (@head.nil? or @head.next.nil?) # empty/single node list


    cur_fast = @head.next.next # fast will check node after @head.next
    cur_slow = @head.next # slow will start at @head.next

    while (cur_fast && cur_slow)
      # return true if nodes are the same object
      return true if cur_fast == cur_slow

      # false if cur_fast can't go to next
      return false if cur_fast.next.nil? 

      # move fast cur 2 nodes ahead, slow node 1
      cur_fast = cur_fast.next.next
      cur_slow = cur_slow.next
    end
    
    return false
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: O(n) - worst case is that you have to travel all nodes of list before adding the node, which is an O(1) operation
  # Space Complexity: O(1) - only one node added per call, other than tracking variables cur and insert_node
  def insert_ascending(value)

    # check if value is smallest or list is empty
    if !@head || value < @head.data
      self.add_first(value)
    else 
      cur = @head 
      
      # stops at last node or node before node that should come after 
      # a node with input value
      while(cur.next && cur.next.data < value)
        cur = cur.next
      end

      insert_node = Node.new(value)
      insert_node.next = cur.next
      cur.next = insert_node

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
