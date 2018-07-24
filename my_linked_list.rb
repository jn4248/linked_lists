module MyLinkedList

  # Singly linked list that uses Class Node to define its nodes.
  class LinkedList

    def initialize
      @head = nil
      @tail = nil
      @size = 0
    end

    # Returns the first node in the list. Returns nil if list is empty.
    def head
      return @head
    end

    # Returns the last node in the list. Returns nil if list is empty.
    def tail
      return @tail
    end

    # Returns the total number of nodes in the list. Returns 0 if list is empty.
    def size
      return @size
    end

    # Adds a new node to the start of the list. Returns the node that was added.
    def prepend(data)
      node = Node.new(data)
      if @head.nil?
        @head = node
        @tail = node
      else
        node.next_node = @head
        @head = node
      end
      @size += 1
      return node
    end

    # Adds a new node to the end of the list. Returns the node that was added.
    def append(data)
      if @head.nil?
        prepend(data)     # prepend() increments @size
      else
        node = Node.new(data)
        @tail.next_node = node
        @tail = node
        @size += 1
      end
      return node
    end

    # Removes the last element from the list.
    # Returns element that was popped, or nil if list was empty
    def pop
      temp = @head
      previous = nil
      unless @head.nil?
        until temp.next_node.nil?
          previous = temp
          temp = temp.next_node
        end
        if previous.nil?
          # linked list has only one node
          @head = nil
          @tail = nil
        else
          previous.next_node = nil
          @tail = previous
        end
        @size -= 1   # no decrement if list was empty
      end
      return temp
    end

    # Returns the node at the given index. Returns nil if index is out of bounds.
    def at(index)
      temp = nil
      # check for empty list, or index out of bounds
      unless @head.nil? || index < 0 || index > @size - 1
        count = 0
        temp = @head
        until count == index || temp.next_node.nil?
          temp = temp.next_node
          count += 1
        end
      end
      return temp
    end

    # Returns the index of the node containing data;
    # Returns nil if a match is not found (includes case where head = nil).
    def find(data)
      index = nil
      unless @head.nil?
        temp = @head
        index = 0
        until temp.value == data || temp.next_node.nil?
          temp = temp.next_node
          index += 1
        end
        # Check if last node matches data, if traversal reaches end of list
        if temp.next_node.nil?
          index = nil unless temp.value == data
        end
      end
      return index
    end

    # Returns true if "data"" is in the list; otherwise returns false.
    def contains?(data)
      return (find(data).nil?) ? false : true
    end

    # Inserts a node at the given index.
    # New nodes can only be inserted if a node already exists at the given index
    # Returns the inserted node; Returns nil if index is out of bounds, or list is empty
    def insert_at(index, data)
      node_inserted = nil
      # check for empty list, or index out of bounds
      unless @head.nil? || index < 0 || index > (@size - 1)
        if index == 0
          node_inserted = prepend(data)      # prepend() increments @size
        else
          # Any index > 0
          count = 0
          temp = @head
          previous = nil
          until count == index || temp.next_node.nil?
            previous = temp
            temp = temp.next_node
            count += 1
          end
          node_inserted = Node.new(data, temp)
          previous.next_node = node_inserted
          @size += 1
        end
      end
      return node_inserted
    end

    # Removes the node at the given index.
    # Returns the removed node; Returns nil if index is out of bounds
    def remove_at(index)
      node_removed = nil
      # check for empty list, or index out of bounds
      unless @head.nil? || index < 0 || index > (@size - 1)
        count = 0
        temp = @head
        previous = nil
        until count == index || temp.next_node.nil?
          previous = temp
          temp = temp.next_node
          count += 1
        end
        node_removed = temp
        if previous.nil?
          # Removing first node
          @head = temp.next_node
          # Set tail if list has only 1 node
          @tail = temp.next_node if temp.next_node.nil?
        else
          # Removing any other node
          previous.next_node = temp.next_node
          @tail = previous if temp.next_node.nil?  # Removing last node
        end
        @size -= 1
      end
      return node_removed
    end

    # Provides a string representation of the linked list.
    def to_s
      list_string = ""
      temp = @head
      until temp.nil?
        value_string = temp.value.to_s.clone
        # Add suffixes for head and tail nodes
        if temp == @head && temp == @tail
          value_string << " (head/tail)"
        elsif temp == @head
          value_string << " (head)"
        elsif temp == @tail
          value_string << " (tail)"
        end
        list_string << "[#{value_string}] -> "
        temp = temp.next_node
      end
      list_string << "nil"
      return list_string
    end

  end   # end of class LinkedList


  # Node class used for Class LinkedList, a singly linked list
  class Node

    attr_accessor :next_node
    attr_reader :value

    def initialize(value, next_node = nil)
      @value = value
      @next_node = next_node
    end

  end   # end of class Node

end   # end of module MyLinkedList
