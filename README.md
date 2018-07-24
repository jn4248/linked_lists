# project_linked_lists
Ruby custom LinkedList class, including method implementations

## Overview
This project follows the Ruby portion of The Odin Project series.  It implements a custom version of class LinkedList (singly linked list), and includes the following methods:

| Method           | Description                                   |
| -----------------|-----------------------------------------------
| head             | Returns the first node in the list.           |
| tail             | Returns the last node in the list.            |
| size             | Returns the total number of nodes in the list.|
| prepend(data)    | Adds a new node to the start of the list.     |
| append(data)     | Adds a new node to the end of the list.       |
| pop              | Removes the last element from the list.       |
| at(index)        | Returns the node at the given index.          |
| find(data)       | Returns the index of the node containing data; Returns nil if a match is not found. |
| contains?(data)  | Returns true if the parameter value is in the list; otherwise returns false. |
| insert_at(index) | Inserts a node at the given index.            |
| remove_at(index) | Removes the node at the given index.          |
| to_s             | Provides a string representation of the linked list, formatted as: `( data ) -> ( data ) -> ( data ) -> nil`|

The file 'my_linked_list.rb' contains the module MyLinkedList, in which are defined the classes LinkedList and Node, as well as the above methods for class LinkedList.  

Class LinkedList makes use of 3 instance variables, to keep track of: Head Node (`head`), Tail Node (`tail`), and the number of nodes in the linked list (`size`).

In class Node, the initialize method accepts arguments for both data (`value`) and the next node (next_node), however the latter is optional (defaults to `next_node = nil`)

## Testing

Testing has been provided for all LinkedList methods through a separate file: 'my_linked_list_test.rb'.  Utility methods have been written in this file, to facilitate testing multiple scenarios.  Each method has been tested for various conditions, though not necessarily in the order listed above.
