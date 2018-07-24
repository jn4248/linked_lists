require "./my_linked_list"

##
 #  Test Utility Methods
 ##

# Param: name - name of the test (String)
def test_header(name)
  puts "\n\n==================================================================="
  puts "==================================================================="
  # puts "-------------------------------------------------------------------"
  puts "\nTesting #{name}:"
  # puts "-------------------------------------------------------------------"
  puts "\n==================================================================="
  puts "==================================================================="
end

# Param: node - node being tested (Node)
#        expect_value = expected value of the node being tested (AnyType)
#        expect_next_value  = expected value of the next node (AnyType)
def test_node(node, expect_value, expect_next_value)
  puts "\n___test_node___"
  value = (node.value.nil?) ? "nil" : node.value
  next_value = (node.next_node.nil?) ? "nil" : node.next_node.value
  puts "Actual:   Value = #{value}  Next_node = #{next_value}"
  puts "Expected: Value = #{expect_value}  Next_node = #{expect_next_value}"
  unless (value == expect_value)  && (next_value == expect_next_value)
    puts "\n>>>> ERROR <<<< (section above) "
  end
end

# Tests the head and tail node values of a linked list
# Param: list - (Linked_list)
#        expect_head - expected head node value (Integer or String)
#        expect_tail - expected tail node value (Integer or String)
def check_list(list, expect_head, expect_tail)
  puts "\n___check_list___"
  head = (list.head.nil?) ? "nil" : list.head.value
  tail = (list.tail.nil?) ? "nil" : list.tail.value
  puts "Actual:   Head = #{head}  Tail = #{tail}"
  puts "Expected: Head = #{expect_head}  Tail = #{expect_tail}"
  unless (head == expect_head)  && (tail == expect_tail)
    puts "\n>>>> ERROR <<<< (section above) "
  end
end

# Param: list - (Linked_list)
#        expect_size - expected size of the linked list (Integer)
def check_size(list, expect_size)
  puts "\n___check_size___"
  puts "List size     = #{list.size}"
  puts "Expected size = #{expect_size}"
  puts "\n>>>> ERROR <<<< (section above) " unless list.size == expect_size
end

# Param: list - (Linked List)
#        index (Integer)
#        expect_value - expected value at indexed position (Integer or String)
def test_at(list, index, expect_value)
  puts "\n___test_at___"
  value = (list.at(index).nil?) ? "nil" : list.at(index).value
  puts "Value at #{index}:   #{value}"
  puts "Expected:     #{expect_value}"
  puts "\n>>>> ERROR <<<< (section above) " unless value == expect_value
end

# Param: list - (Linked List)
#        value - value being located (AnyType)
#        expect_index - expected index of node containing data (Integer)
def test_find(list, value, expect_index)
  puts "\n___test_find___"
  index = (list.find(value).nil?) ? "nil" : list.find(value)
  puts "Index for node with value '#{value}':  #{index}"
  puts "Expected:  #{expect_index}"
  puts "\n>>>> ERROR <<<< (section above) " unless index == expect_index
end

# Param: list - (Linked List)
#        value - value being located (AnyType)
#        expect_found - true/false if expected to contain (Boolean)
def test_contains(list, value, expect_found)
  puts "\n___test_contains___"
  puts "List contains '#{value}'?  #{list.contains?(value)}"
  puts "Expected:  #{expect_found}"
  puts "\n>>>> ERROR <<<< (section above) " unless list.contains?(value) == expect_found
end
# Checks the to_s string representation of the list
# Param: list - (Linked List)
#        expect_string - the expected string representation
def check_string(list, expect_string)
  puts "\n___check_string___"
  list_string = list.to_s
  puts "to_s string: '#{list_string}'"
  puts "Expected:    '#{expect_string}'"
  puts "\n>>>> ERROR <<<< (section above) " unless list_string == expect_string
end

# Param: description - what situation is being tested
#        list - (Linked List)
#        index - position at which to insert new node (Integer)
#        value - value being inserted (AnyType)
#        node_nil - whether inserted/returned node should be nil (Boolan)
#        expect_string - expected string of list nodes after insertion (String)
def test_insert_at(description, list, index, value, node_nil, expect_string)
  puts "\n\n___test_insert_at___"
  puts "Test: #{description}"
  puts "Trying to insert '#{value}' at index #{index}..."
  node = list.insert_at(index, value)
  puts "\nNode inserted was:"
  p node
  msg = (node_nil) ? "nil" : "An actual node with value '#{value}'"
  puts "Expected: #{msg}"
  list_string = list.to_s
  puts "\nList String after inserting: '#{list_string}'"
  puts "Expected string            : '#{expect_string}'"
  # if insert_at should fail, check that it returns nil
  if node_nil == true
    puts "\n>>>> ERROR <<<< (section above)  Nil not matching" unless node.nil?
  end
  # check that the actual list order of nodes was correct
  unless list_string == expect_string
    puts "\n>>>> ERROR <<<< (section above)  List string order not matching"
  end
end

# Param: description - what situation is being tested
#        list - (Linked List)
#        index - position at which to insert new node (Integer)
#        value - value of the node being removed (AnyType)
#        node_nil - whether removed/returned node should be nil (Boolan)
#        expect_string - expected string of list nodes after removal (String)
def test_remove_at(description, list, index, value, node_nil, expect_string)
  puts "\n\n___remove_at___"
  puts "Test: #{description}"
  puts "Trying to remove node at index #{index}..."
  node = list.remove_at(index)
  puts "\nNode Removed was:"
  p node
  msg = (node_nil) ? "nil" : "An actual node with value '#{value}'"
  puts "Expected: #{msg}"
  list_string = list.to_s
  puts "\nList String after removing: '#{list_string}'"
  puts "Expected string           : '#{expect_string}'"
  # if remove_at should fail, check that it returns nil
  if node_nil == true
    puts "\n>>>> ERROR <<<< (section above)  Nil not matching" unless node.nil?
  end
  # check that the actual list order of nodes was correct
  unless list_string == expect_string
    puts "\n>>>> ERROR <<<< (section above)  List string order not matching"
  end
end


##
#  Tests
##

# Test NODE class
test_header("NODE class")
node_a = MyLinkedList::Node.new(5)
test_node(node_a, 5, "nil")
node_b = MyLinkedList::Node.new(-5, node_a)
test_node(node_b, -5, 5)


# Test LINKEDLIST class
test_header("LINKEDLIST class")
ll = MyLinkedList::LinkedList.new()
check_list(ll, "nil", "nil")


# Test PREPEND
test_header("PREPEND")
ll = MyLinkedList::LinkedList.new()
ll.prepend(5)
check_list(ll, 5, 5)
ll.prepend(10)
check_list(ll, 10, 5)


# Test APPEND
test_header("APPEND")
ll = MyLinkedList::LinkedList.new()
ll.append(5)
check_list(ll, 5, 5)
ll.append(10)
check_list(ll, 5, 10)


# Test SIZE
test_header("SIZE")
ll = MyLinkedList::LinkedList.new()
check_size(ll, 0)
ll.append(5)
check_size(ll, 1)
ll.prepend(10)
check_size(ll, 2)


# Test HEAD and Tail
test_header("HEAD and TAIL")
ll = MyLinkedList::LinkedList.new()
check_list(ll, "nil", "nil")
ll.append(5)
check_list(ll, 5, 5)
ll.prepend(10)
check_list(ll, 10, 5)


# Test AT
test_header("AT")
ll = MyLinkedList::LinkedList.new()
test_at(ll, -1, "nil")
test_at(ll, 2, "nil")
test_at(ll, 0, "nil")
ll.append(5)
test_at(ll, -1, "nil")
test_at(ll, 2, "nil")
test_at(ll, 0, 5)
ll.prepend(10)
test_at(ll, 0, 10)
test_at(ll, 1, 5)


# Test POP
test_header("POP")
ll = MyLinkedList::LinkedList.new()
ll.append(5)
check_list(ll, 5, 5)
check_size(ll, 1)
ll.pop
check_list(ll, "nil", "nil")
check_size(ll, 0)
ll.append(10)
ll.prepend(5)
ll.append(15)
check_list(ll, 5, 15)
check_size(ll, 3)
ll.pop()
check_list(ll, 5, 10)
check_size(ll, 2)
ll.pop()
check_list(ll, 5, 5)
check_size(ll, 1)
ll.pop()
check_list(ll, "nil", "nil")
check_size(ll, 0)


# Test FIND
test_header("FIND")
ll = MyLinkedList::LinkedList.new()
test_find(ll, 10, "nil")
test_find(ll, "Tom", "nil")
ll.append(10)
test_find(ll, 10, 0)
ll.prepend(5)
test_find(ll, 10, 1)
test_find(ll, 20, "nil")
test_find(ll, "Tom", "nil")
ll.append(15)
test_find(ll, 15, 2)
ll.pop
test_find(ll, 15, "nil")
ll.append("Tim")
test_find(ll, "Tim", 2)
test_find(ll, "Tom", "nil")


# Test CONTAINS?
test_header("CONTAINS?")
ll = MyLinkedList::LinkedList.new()
test_contains(ll, 5, false)
test_contains(ll, "Tom", false)
ll.append(5)
test_contains(ll, 5, true)
ll.append(10)
test_contains(ll, 5, true)
test_contains(ll, 10, true)
test_contains(ll, 15, false)
ll.prepend("Tom")
test_contains(ll, "Tom", true)


# Test TO_S
test_header("TO_S")
ll = MyLinkedList::LinkedList.new()
check_string(ll, "nil")
check_list(ll, "nil", "nil")
ll.append(10)
check_string(ll, "[10 (head/tail)] -> nil")
check_list(ll, 10, 10)
ll.append("Tom")
check_string(ll, "[10 (head)] -> [Tom (tail)] -> nil")
check_list(ll, 10, "Tom")
ll.prepend(5)
check_string(ll, "[5 (head)] -> [10] -> [Tom (tail)] -> nil")
check_list(ll, 5, "Tom")
ll.pop
check_string(ll, "[5 (head)] -> [10 (tail)] -> nil")
check_list(ll, 5, 10)


# Test INSERT_AT
# Parameters: (list, index, value, node_nil, expect_string)
# Note: must test cases where LinkedList size is each 0, 1, and 2 because of
#       the various cases inside insert_at() (size 2 covers for 2 and larger)
test_header("INSERT_AT")
ll = MyLinkedList::LinkedList.new()

# test: size 0, out of range negative
test_desc = "List size: 0, out of range: negative (index -1) (index -1)"
test_insert_at(test_desc, ll, -1, "Out_of_Range", true, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")
# test: size 0, out of range positive
test_desc = "List size: 0, out of range: positive (index 1)"
test_insert_at(test_desc, ll, 1, "Out_of_Range", true, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")
# test: size 0, insert at index 0
test_desc = "List size: 0, insert at index 0"
test_insert_at(test_desc, ll, 0, "Out_of_Range", true, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")

puts "\n...Appending '5'..."
ll.append(5)
check_string(ll, "[5 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 5, 5)


#test: size 1, out of range negative
test_desc = "List size: 1, out of range: negative (index -1)"
test_insert_at(test_desc, ll, -1, "Out_of_Range", true, "[5 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 5, 5)
#test: size 1, out of range positive
test_desc = "List size: 1, out of range: positive (index 1)"
test_insert_at(test_desc, ll, 1, "Out_of_Range", true, "[5 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 5, 5)
#test: size 1, insert at 0
test_desc = "List size: 1, insert at index 0"
test_insert_at(test_desc, ll, 0, 10, false, "[10 (head)] -> [5 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 5)

puts "\n...Popping last node..."
ll.pop                                          # remove '5'
check_string(ll, "[10 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 10, 10)

#test: size 1, insert at 1
test_desc = "List size: 1, insert at index 1"
test_insert_at(test_desc, ll, 1, "Out_of_Range", true, "[10 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 10, 10)

puts "\n...Appending '15'..."
ll.append(15)
check_string(ll, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)


#test: size 2, out of range negative
test_desc = "List size: 2, out of range: negative (index -1)"
test_insert_at(test_desc, ll, -1, "Out_of_Range", true, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)
#test: size 2, out of range positive
test_desc = "List size: 2, out of range: positive (index 2)"
test_insert_at(test_desc, ll, 2, "Out_of_Range", true, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)
#test: size 2, insert at 0
test_desc = "List size: 2, insert at index 0"
test_insert_at(test_desc, ll, 0, "Tom", false, "[Tom (head)] -> [10] -> [15 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 15)

puts "\n...Popping last node..."
ll.pop                                          # remove '15'
check_string(ll, "[Tom (head)] -> [10 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, "Tom", 10)

#test: size 2, insert at 1
test_desc = "List size: 2, insert at index 1"
test_insert_at(test_desc, ll, 1, "Jim", false, "[Tom (head)] -> [Jim] -> [10 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 10)

puts "\n...Popping last node..."
ll.pop                                          # remove '10'
check_string(ll, "[Tom (head)] -> [Jim (tail)] -> nil")
check_size(ll, 2)
check_list(ll, "Tom", "Jim")

#test: size 2, insert at 2
test_desc = "List size: 2, insert at index 2"
test_insert_at(test_desc, ll, 2, "Out_of_Range", true, "[Tom (head)] -> [Jim (tail)] -> nil")
check_size(ll, 2)
check_list(ll, "Tom", "Jim")

puts "\n...Appending '15'..."
ll.append(15)
check_string(ll, "[Tom (head)] -> [Jim] -> [15 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 15)


#test: size 3, out of range negative
test_desc = "List size: 3, out of range: negative (index -1)"
test_insert_at(test_desc, ll, -1, "Out_of_Range", true, "[Tom (head)] -> [Jim] -> [15 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 15)
#test: size 3, out of range positive
test_desc = "List size: 3, out of range: positive (index 3)"
test_insert_at(test_desc, ll, 3, "Out_of_Range", true, "[Tom (head)] -> [Jim] -> [15 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 15)
#test: size 3, insert at 0
test_desc = "List size: 3, insert at index 0"
test_insert_at(test_desc, ll, 0, "Dan", false, "[Dan (head)] -> [Tom] -> [Jim] -> [15 (tail)] -> nil")
check_size(ll, 4)
check_list(ll, "Dan", 15)

puts "\n...Popping last node..."
ll.pop                                          # remove '15'
check_string(ll, "[Dan (head)] -> [Tom] -> [Jim (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Dan", "Jim")

#test: size 3, insert at 1
test_desc = "List size: 3, insert at index 1"
test_insert_at(test_desc, ll, 1, "20", false, "[Dan (head)] -> [20] -> [Tom] -> [Jim (tail)] -> nil")
check_size(ll, 4)
check_list(ll, "Dan", "Jim")

puts "\n...Popping last node..."
ll.pop                                          # remove 'Jim'
check_string(ll, "[Dan (head)] -> [20] -> [Tom (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Dan", "Tom")

#test: size 3, insert at 2
test_desc = "List size: 3, insert at index 2"
test_insert_at(test_desc, ll, 2, "Bob", false, "[Dan (head)] -> [20] -> [Bob] -> [Tom (tail)] -> nil")
check_size(ll, 4)
check_list(ll, "Dan", "Tom")

puts "\n...Popping last node..."
ll.pop                                          # remove 'Tom'
check_string(ll, "[Dan (head)] -> [20] -> [Bob (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Dan", "Bob")

#test: size 3, insert at 3
test_desc = "List size: 3, insert at index 3"
test_insert_at(test_desc, ll, 3, "Out_of_Range", true, "[Dan (head)] -> [20] -> [Bob (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Dan", "Bob")


# Test REMOVE_AT
# Parameters: (description, list, index, value, node_nil, expect_string)
test_header("REMOVE_AT")
ll = MyLinkedList::LinkedList.new()

# test: size 0, out of range negative
test_desc = "List size: 0, out of range: negative (index -1)"
test_remove_at(test_desc, ll, -1, "nil", true, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")
# test: size 0, out of range positive
test_desc = "List size: 0, out of range: positive (index 1)"
test_remove_at(test_desc, ll, 1, "nil", true, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")
# test: size 0, remove at index 0
test_desc = "List size: 0, remove at index 0"
test_remove_at(test_desc, ll, 0, "nil", true, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")

puts "\n...Appending '5'..."
ll.append(5)
check_string(ll, "[5 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 5, 5)


#test: size 1, out of range negative
test_desc = "List size: 1, out of range: negative (index -1)"
test_remove_at(test_desc, ll, -1, "nil", true, "[5 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 5, 5)
#test: size 1, out of range positive
test_desc = "List size: 1, out of range: positive (index 1)"
test_remove_at(test_desc, ll, 1, "nil", true, "[5 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 5, 5)
#test: size 1, remove at 0
test_desc = "List size: 1, remove at index 0"
test_remove_at(test_desc, ll, 0, 5, false, "nil")
check_size(ll, 0)
check_list(ll, "nil", "nil")

puts "\n...Appending '10' and '15'..."
ll.append(10)
ll.append(15)
check_string(ll, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)


#test: size 2, out of range negative
test_desc = "List size: 2, out of range: negative (index -1)"
test_remove_at(test_desc, ll, -1, "nil", true, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)
#test: size 2, out of range positive
test_desc = "List size: 2, out of range: positive (index 2)"
test_remove_at(test_desc, ll, 2, "nil", true, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)
#test: size 2, remove at 0
test_desc = "List size: 2, remove at index 0"
test_remove_at(test_desc, ll, 0, 10, false, "[15 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 15, 15)

puts "\n...Prepending '10'..."
ll.prepend(10)
check_string(ll, "[10 (head)] -> [15 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, 10, 15)

#test: size 2, remove at 1
test_desc = "List size: 2, remove at index 1"
test_remove_at(test_desc, ll, 1, 15, false, "[10 (head/tail)] -> nil")
check_size(ll, 1)
check_list(ll, 10, 10)

puts "\n...Prepending 'Jim' and 'Tom'..."
ll.prepend("Jim")
ll.prepend("Tom")
check_string(ll, "[Tom (head)] -> [Jim] -> [10 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 10)


#test: size 3, out of range negative
test_desc = "List size: 3, out of range: negative (index -1)"
test_remove_at(test_desc, ll, -1, "nil", true, "[Tom (head)] -> [Jim] -> [10 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 10)
#test: size 3, out of range positive
test_desc = "List size: 3, out of range: positive (index 3)"
test_remove_at(test_desc, ll, 3, "nil", true, "[Tom (head)] -> [Jim] -> [10 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 10)

#test: size 3, remove at 0
test_desc = "List size: 3, remove at index 0"
test_remove_at(test_desc, ll, 0, "Tom", false, "[Jim (head)] -> [10 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, "Jim", 10)

puts "\n...Prepending 'Tom'..."
ll.prepend("Tom")
check_string(ll, "[Tom (head)] -> [Jim] -> [10 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Tom", 10)

#test: size 3, remove at 1
test_desc = "List size: 3, remove at index 1"
test_remove_at(test_desc, ll, 1, "Jim", false, "[Tom (head)] -> [10 (tail)] -> nil")
check_size(ll, 2)
check_list(ll, "Tom", 10)

puts "\n...Prepending 'Dan'..."
ll.prepend("Dan")
check_string(ll, "[Dan (head)] -> [Tom] -> [10 (tail)] -> nil")
check_size(ll, 3)
check_list(ll, "Dan", 10)

#test: size 3, remove at 2
test_desc = "List size: 3, remove at index 2"
test_remove_at(test_desc, ll, 2, 10, false, "[Dan (head)] -> [Tom (tail)] -> nil")
check_size(ll, 2)
check_list(ll, "Dan", "Tom")
