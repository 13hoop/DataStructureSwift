import Foundation
/*
 Link list implemeted in Swift3 ,here we'll implement what's called a doubly linked list where each node contains a list to the previous as well
 */


/*
 Nodes: container that will hold our values and the reference to the next and previous values, and also make it generic over the type T.
 Because Linked List are based on reference semantics we are going to use a class rather than a struct
 */
public class Node<T: Equatable> {
  typealias NodeType = Node<T>
  
  public let value: T
  var next: NodeType? = nil
  var previous: NodeType? = nil
  
  public init(value: T) {
    self.value = value
  }
}
extension Node: CustomStringConvertible {
  public var description: String {
    get {
      return "Node(\(value))"
    }
  }
}

/*
 List: have two references, a count, isEmplty method
 */
public final class LinkedList<T: Equatable> {
  public typealias NodeType = Node<T>
  
  var start: NodeType? {
    didSet {
      if end == nil {
        end = start
      }
    }
  }
  
  var end: NodeType? {
    didSet {
      if start == nil {
        start = end
      }
    }
  }
  
  public var count: Int = 0
  
  public var isEmpty: Bool {
    get {
      return count == 0
    }
  }
  
  public init() {
    
  }
  // init LinkedList with a sequece
  public init<S: Sequence>(_ elements: S) where S.Iterator.Element == T {
    for element in elements {
      append(value: element)
    }
  }
}

/*
 Opetations 
 - append / remove
 - nodeAt / valueAt
 */
extension LinkedList {
  
  /// iterate over all nodes in the list invoking a block 
  /// - complexity: O(n)
  private func iterate(block: (_ node: NodeType, _ index: Int) throws -> NodeType?) rethrows -> NodeType? {
    var node = start
    var index = 0
    
    while node != nil {
      let result = try block(node!, index)
      if result != nil {
        return result
      }
      index += 1
      node = node?.next
    }
    return nil
  }
  
  /// node at a given index
  /// - complexity: O(n)
  public func nodeAt(index: Int) -> NodeType {
    precondition(index >= 0 && index < count, "⚠️ Index \(index) out of bounds")
    
    let result = iterate {
      if $1 == index {
        return $0
      }
      return nil
    }
    return result!
  }
  /// node value at a given index
  /// - complexity: O(n)
  public func valueAt(index: Int) -> T {
    let node = nodeAt(index: index)
    return node.value
  }
  
  /// Add an element to the front of the list.
  /// using optional type -- no need to check lastEnd for nil, that's awosome😊！
  /// - complexity: O(1)
  public func append(value: T) {
    let lastEnd = end
    end = NodeType(value: value)
    end?.previous = lastEnd
    lastEnd?.next = end
    
    count += 1
  }
  /// Remove a give node from the
  /// - complexity: O(1)
  public func remove(node: NodeType) {
    let nextNode = node.next
    let previousNode = node.previous
    
    if node === start && node === end {
      start = nil
      end = nil
    }else if node === start {
      start = node.next
    }else {
      previousNode?.next = nextNode
      nextNode?.previous = previousNode
    }
    count -= 1
    assert(
      (end != nil && start != nil && count >= 1) || (end == nil && start == nil && count == 0),
      "⚠️ Internal invariant not upheld at the end of remove"
    )
  }
  /// Remove a give node from the list at a given index
  /// - complexity: O(n)
  public func remove(atIndex index: Int) {
    precondition(index >= 0 && index < count ,  "⚠️ Index \(index) out of bounds")
    
    let result = iterate {
      if $1 == index {
        return $0
      }
      return nil
    }
    
    remove(node: result!)
  }
}

/*
  Sequence protocol(SequenceType in swift2): make linkedList iteratored over using for...in and some default methords like forEach, map, filter... 
  Need to implement `makeIterator` methord that returns an iterator conforming to the IteratorProcotol
  LinkedList --> Sequence
                    |--> IteratorProcotol: makeIterator
 */
extension LinkedList: Sequence {
  public typealias Iterator = LinkedListIterator<T>
  public func makeIterator() -> LinkedList.Iterator {
    return LinkedListIterator(startNode: start)
  }
}

public struct LinkedListIterator<T: Equatable>: IteratorProtocol {
  public typealias Element = Node<T>
  
  private var currentNode: Element?
  
  init(startNode: Element?) {
    currentNode = startNode
  }
  
  public mutating func next() -> LinkedListIterator.Element? {
    let node = currentNode
    currentNode = currentNode?.next
    return node
  }
}


/*
  TEST HERE
 */
var list = LinkedList<String>()
list.append(value: "this")
list.append(value: "is")
list.append(value: "List")

for node in list {
  print("\(node)")
}

let values: [String] = list.map {
  $0.value
}
print(values)