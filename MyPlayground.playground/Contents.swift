class Node {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BST {
    
    var root: Node
    
    init(value: Int) {
        self.root = Node(value: value)
    }
    
    func search(_ value: Int) -> Bool {
        return searchHelper(root, value: value)
    }
    
    // create a node with the given value and insert it into the binary tree
    func insert(_ value: Int) {
        return insertHelper(root, value: value)
    }
    
    // helper method - use to implement a recursive search function
   private func searchHelper(_ current: Node?, value: Int) -> Bool {
       if let current = current {
           if value == current.value {
               return true
           } else if current.value > value {
               return searchHelper(current.left, value: value)
           } else {
               return searchHelper(current.right, value: value)
           }
       }
        return false
    }
    
    // helper method - use to implement a recursive insert function
  private func insertHelper(_ current: Node, value: Int) {
      if current.value < value {
          if let right = current.right {
              insertHelper(right, value: value)
          } else {
              current.right = Node(value: value)
          }
      }else {
          if let left = current.left {
              insertHelper(left, value: value)
          } else {
              current.left = Node(value: value)
          }
      }
    }
}

// Test cases
// Set up tree
let tree = BST(value: 4)

// Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(5)

// Check search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false
