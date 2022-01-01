class QueueWithoutLinkedList {
    var storage : [Int]
    init(head : Int){
        self.storage = [head]
    }
    // add the element to the queue
       func enqueue(_ element: Int) {
           storage.append(element)
       }
       
       // return the next element to be dequeued from the queue
       // if the queue is empty, return nil
       func peek() -> Int? {
           return storage.first
       }
       
       // remove and return the next element to be dequeued
       func dequeue() -> Int? {
        return storage.removeFirst()
       }
}


class Queue {
    var head : Node?
    init(head : Node?) {
        self.head = head
    }
    func push (_ node : Node?){ // insert at first
        let newNode = node
        let current = head
        if current != nil {
            newNode?.next = current
            head = newNode
        } else {
            head = newNode
        }
    }
    
    func pop() -> Node? { // remove last
        var current = head
        var prev : Node?
        while current?.next != nil {
            prev = current
            current = current?.next
        }
        prev?.next = nil
        return current
    }
    
    func peek () -> Node? { // return head
        return head
    }
    func enqueu(_ node : Node?) { // insert at tail
        let newNode = node
        var current = head
        while current?.next != nil {
            current = current?.next
        }
        current?.next = newNode
        newNode?.next = nil
    }
    
    func dequeu () -> Node?{ // remove head
        let current = head
        head = head?.next
        current?.next = nil
        return current
    }
    
    func printVal(){
        var current = head
        while current != nil {
            print(current?.value ?? "Nothing")
            current = current?.next
        }
    }
}


class Stack {
    var head : Node?
    init(top: Node?) {
        self.head = top
    }
    
    func push (_ node : Node?){ // insert at first
        let newNode = node
        let current = head
        
        if current != nil {
            newNode?.next = current
            head = newNode
        } else {
            head = newNode
        }
    }

    func pop () -> Node? { // remove first
        let current = head
        head = current?.next
        current?.next = nil
        return current
    }
    func printVal(){
        var current = head
        while current != nil {
            print(current?.value ?? "Nothing")
            current = current?.next
        }
    }
}




class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {

        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    // Get a node from a particular position.
    // Assume the first position is "1".
    // Return "nil" if position is not in the list.
    func getNode(atPosition position: Int) -> Node? {
        guard position > 0 else {
                return nil
            }

            var counter = 1
            var current = head

            while current != nil && counter <= position {
                if counter == position {
                    return current
                }
                current = current?.next
                counter += 1
            }
            return nil
    }
    
    // Insert a new node at the given position.
    // Assume the first position is "1".
    // Inserting at position 3 means between
    // the 2nd and 3rd nodes.
    func insertAtFirst(_ node : Node?){
        let newNode = node
        let current = head
        if current != nil {
            newNode?.next = current
            head = newNode
        } else {
            head = newNode
        }
    }
    
    func inserAtLast(_ node : Node?){
        let newNode = node
        var current = head
        while current?.next != nil{
            current = current?.next
        }
        current?.next = newNode
        newNode?.next = nil
    }
    
    func insertNode(_ node: Node, at position: Int) {
        guard position > 0 else {
            return
        }

        var counter = 1
        var current = head

        if position > 1 {
            while current != nil && counter < position {
                if counter == position - 1 {
                    node.next = current?.next
                    current?.next = node
                    break
                }
                current = current?.next
                counter += 1
            }
        } else if position == 1 {
            node.next = head
            head = node
        }
    }
    
    func deleteLast(){
        var current = head
        var prev : Node?
        while current?.next != nil {
            prev = current
            current = current?.next
        }
        prev?.next = nil
    }
    
    func deleteFirst(){
        let current = head
        if current != nil {
            head = current?.next
            current?.next = nil
        }
    }
    // Delete the first node with a given value.
    func deleteNode(withValue value: Int) {
        var current = head
        var prev : Node?
        
        while current?.value != value && current?.next != nil {
            prev = current
            current = current?.next
        }
        
        if current?.value == value {
            if prev != nil {
                prev?.next = current?.next
                current?.next = nil
            }else {
                head = current?.next
                current?.next = nil
            }
        }
    }
    
    func printVal(){
        var current = head
        while current != nil {
            print(current?.value ?? "Nothing")
            current = current?.next
        }
    }
    

    
}

// Test cases

// Set up some Nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)
let n5 = Node(value: 5)
let n6 = Node(value: 6)

let qu = Queue(head: n1)
qu.push(n2)
qu.push(n5)
qu.pop()
qu.printVal()
print("------------")
print(qu.peek()!.value)
print("------------")
qu.enqueu(n3)
qu.printVal()
print("------------")
qu.dequeu()
qu.printVal()
// Start setting up a LinkedList
//let ll = LinkedList(head: n1)
//ll.append(n2)
//ll.append(n3)
//ll.insertAtFirst(n5)
//ll.inserAtLast(n6)
//ll.printVal()
//print("---------------------")
//let stack = Stack(top: n1)
//stack.push(n4)
//stack.push(n5)
//stack.printVal()
//print("---------------------")
//print(stack.pop()!.value)
//print(stack.pop()!.value)
//print("---------------------")
//stack.printVal()
//ll.printVal()
//print("-------------------")
//ll.deleteLast()
//ll.deleteFirst()
//ll.printVal()
//print("-------------------")
//ll.deleteNode(withValue: 1)
//ll.printVal()
// Test getNode(atPosition:)
//print(ll.head?.next?.next?.value ?? "nothing") // Should print 3
//print(ll.getNode(atPosition: 3)?.value ?? "nothig")
//
////
//// Test insert
//print(ll.head?.next?.next?.value ?? "nothing")

//ll.insertNode(n4, at: 3)
//print(ll.head?.next?.next?.value ?? "nothing")
//print(ll.getNode(atPosition: 3)!.value) // Should print 4 now

//ll.printVal()
//// Test delete(withValue:)
//ll.deleteNode(withValue: 1)
//print(ll.getNode(atPosition: 1)!.value) // Should print 2 now
//print(ll.getNode(atPosition: 2)!.value) // Should print 4 now
//print(ll.getNode(atPosition: 3)!.value) // Should print 3

