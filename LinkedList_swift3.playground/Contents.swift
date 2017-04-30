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
  
  private var start: NodeType? {
    didSet {
      if end == nil {
        end = start
      }
    }
  }
  
  private var end: NodeType? {
    didSet {
      if start == nil {
        start = end
      }
    }
  }
  
  public private(set) var count: Int = 0
  
  public var isEmpty: Bool {
    get {
      return count == 0
    }
  }
  
  public init() {
    
  }
  // init LinkedList with a sequece
  public init<S: Sequence where S.Interator.Element == T>(_ elements: S) {
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
  privat func iterate(block: (node: NodeType, index: Int) throws -> NodeType?) rethrows -> NodeType? {
    var node = start
    var index = 0
    
    while node != nil {
      let result = try block(node: node!, index: index)
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
      (end != nil && start != nil && count >= 1) || (end == nil && start == nil & count == 0),
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

