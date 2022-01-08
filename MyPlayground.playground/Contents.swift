import Foundation
//Indirect enums are enums that need to reference themselves
//https://www.hackingwithswift.com/example-code/language/what-are-indirect-enums
  indirect enum BinaryTree<T> {
  case node(BinaryTree<T>, T, BinaryTree<T>) // reference themselves
  case empty
}

extension BinaryTree: CustomStringConvertible {
   public var description: String { // need to be public because CustomStringConvertible its a public protocol
    switch self {
    case let .node(left, value, right):
        return "value: \(value), left = [\(left.description)], right = [\(right.description)]"
    case .empty:
      return ""
    }
  }
}
extension BinaryTree {
   func traverseInOrder(process: (T) -> Void) { // func take a callback func
    if case let .node(left, value, right) = self { // let for destructure this node case attributes
      left.traverseInOrder(process: process)
      process(value)
      right.traverseInOrder(process: process)
    }
  }
    func traversePreOrder(process : (T) -> Void){
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    func traversePostOrder(process : (T) -> Void){
        if case let .node(left, value, right) = self {
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
            process(value)
        }
    }
    
    
}
// leaf nodes
let node5 = BinaryTree.node(.empty, "5", .empty)
let nodeA = BinaryTree.node(.empty, "a", .empty)
let node10 = BinaryTree.node(.empty, "10", .empty)
let node4 = BinaryTree.node(.empty, "4", .empty)
let node3 = BinaryTree.node(.empty, "3", .empty)
let nodeB = BinaryTree.node(.empty, "b", .empty)

// intermediate nodes on the left
let Aminus10 = BinaryTree.node(nodeA, "-", node10)
let timesLeft = BinaryTree.node(node5, "*", Aminus10)

// intermediate nodes on the right
let minus4 = BinaryTree.node(.empty, "-", node4)
let divide3andB = BinaryTree.node(node3, "/", nodeB)
let timesRight = BinaryTree.node(minus4, "*", divide3andB)

// root node
let treeEnum = BinaryTree.node(timesLeft, "+", timesRight)


//treeEnum.traversePostOrder(process: {str in
//    print(str)
//})




// Types that conform to the CustomStringConvertible protocol can provide their own representation to be used when converting an instance to a string
//struct Point {
//    let x: Int, y: Int
//}
//
//let p = Point(x: 21, y: 30)
//print(p)
// Prints "Point(x: 21, y: 30)"

//extension Point: CustomStringConvertible {
//    var description: String {
//        return "(\(x), \(y))"
//    }
//}
//
//print(p)
// Prints "(21, 30)"


class Node {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaryTreeClass {
    
    var root: Node
    
    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }
    
    // Return true if the value is in the tree, otherwise return false
    func search(_ value: Int) -> Bool {
        return preorderSearch(root, value: value)
    }
    
    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    func printTree() -> String {
        var result = preorderPrint(root, traverse: "")
        result?.removeLast() // removing last char " - "
        return result ?? ""
    }
    
    // Helper method - use to create a recursive search solution.
  private func preorderSearch(_ start: Node?, value: Int) -> Bool {
        if let start = start {
            if start.value == value {
                return true
            }else {
            return preorderSearch(start.left, value: value) || preorderSearch(start.right, value: value)
            }
        }
        return false
    }
    // Helper method - use to construct a string representing the preordered nodes
  private func preorderPrint(_ start: Node?, traverse: String) -> String? {
        var result = traverse
      if let start = start {
          result += "\(start.value)-" // root
          if let newVal = preorderPrint(start.left, traverse: result){
              result = newVal
          }
          if let newVal = preorderPrint(start.right, traverse: result){
              result = newVal
          }
      }
      return result
    }
}

// Test cases
// Set up tree
let tree = BinaryTreeClass(rootValue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false

// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3
