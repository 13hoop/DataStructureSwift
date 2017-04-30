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
  
  public init<S: Sequence where S.Interator.Element == T>(_ elements: S) {
    for element in elements {
      append(value: element)
    }
  }

}

