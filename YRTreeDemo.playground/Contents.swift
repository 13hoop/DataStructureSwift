import UIKit

//class Node {
//    var value: String
//    var children: [Node] = []
//    weak var parent: Node?
//
//    init(value: String) {
//        self.value = value
//    }
//
//    func add(child: Node) {
//        child.parent = self
//        self.children.append(child)
//    }
//}
//
//extension Node: CustomStringConvertible {
//    var description: String {
//        var text = "\(value)"
//
///* 这里使用了map和递归，如果感到困惑的化，不妨使用
//    if !children.isEmpty {
//        text += " [<- "
//
//        for child in children {
//            if children.last?.value != child.value {
//                text += child.description + " -- "
//            } else {
//                text += child.description
//            }
//        }
//        text += " ->] "
//    }
//*/
//
//        if(!children.isEmpty) {
//            text += " [<- " + children.map {
//                $0.description
//            }.joined(separator: " -- ") + " ->] "
//        }
//        return text
//    }
//}
//
//let nba = Node(value: "NBA")
//let west = Node(value: "WestSec")
//let east = Node(value: "EastSec")
//nba.add(child: east)
//nba.add(child: west)
//
//let lakers = Node(value: "LAKERs")
//let rockets = Node(value: "ROCKETs")
//let spurs = Node(value: "Spurs")
//west.add(child: lakers)
//west.add(child: rockets)
//west.add(child: spurs)
//
//let nets = Node(value: "NETs")
//let celtics = Node(value: "CEltics")
//let bull = Node(value: "BULLs")
//east.add(child: celtics)
//east.add(child: bull)
//east.add(child: nets)
//
//print(nba)




// ------ binary Tree Node
class BiTNode {
    var value: String
    var letfChild: BiTNode?
    var rightChild: BiTNode?

    init(value: String) {
        self.value = value
        self.letfChild = nil
        self.rightChild = nil
    }

    init() {
        self.value = ""
        self.letfChild = nil
        self.rightChild = nil
    }
}

class BitTree {
    var root: BiTNode?
    var isEmty: Bool {
        get {
            if root == nil {
                return true
            }
            return false
        }
    }
    
    
    var x: Int = 0
    func height(node: BiTNode?) -> Int {
        x += 1
        if node == nil {
            return 0
        }else {
            let i = height(node: node!.letfChild)
            let j = height(node: node!.rightChild)
            return i>j ? i+1 : j+1
        }
    }
    
    init(root: BiTNode?) {
        self.root = root
    }
    
    open func preTraversal() {
        print(" ---- pre Traversal Recursive ---")
        preOder(root: root)
    }
    
    open func inTraversal() {
        postOrder(root: root)
    }
    
    open func postTraversal() {
        postOrder(root: root)
    }

    private func preOder(root: BiTNode?) {
        guard let curr = root else {
            return
        }
        print(curr.value)
        preOder(root: curr.letfChild)
        preOder(root: curr.rightChild)
    }
    
    private func inOrder(root: BiTNode?) {
        guard let curr = root else {
            return
        }
        inOrder(root: curr.letfChild)
        print(curr.value)
        inOrder(root: curr.rightChild)
    }
    
    private func postOrder(root: BiTNode?) {
        guard let curr = root else {
            return
        }
        postOrder(root: curr.letfChild)
        postOrder(root: curr.rightChild)
        print(curr.value)
    }
    
    // Iteration & stack
    func preOrderIteration() {
        var arr: [BiTNode] = []
        var curr = root
        print(" ---- pre Traversal Iteration ---")
        while true {
            if curr != nil {
                print(" push--> " + curr!.value)
                arr.append(curr!)
                curr = curr!.letfChild
            }else {
                if arr.count == 0 {
                    break;
                }
                let last = arr.last
//                print(" pop--> " + (last!.value))
                arr.removeLast()
                curr = last!.rightChild
            }
        }
    }
    
    func inOrderIteration() {
        var arr:[BiTNode] = []
        var curr = root
        print(" ---- in Traversal Iteration ---")
        while true {
            if curr != nil {
                arr.append(curr!)
                curr = curr?.letfChild
            }else {
                if arr.count == 0 {
                    break;
                }
                
                var last = arr.last!
                print("--> pop \(last.value)")
                arr.removeLast()
                curr = last.rightChild
            }
        }
    }
    
    func postOrderIteration() {
        var arr:[BiTNode] = []
        var curr = root
        print(" ---- post Traversal Iteration ---")
        while true {
            if curr != nil {
                arr.append(curr!)
//                print("--> push \(curr?.value)")
                curr = curr?.letfChild

            }else {
                if arr.count == 0 {
                    break;
                }
                
                var last = arr.last!
                arr.removeLast()
                curr = last.rightChild

            }
        }
    }   
}


// ----- test
/*
          NBA
        /     \
  WestSec     EastSec
       \       /      \
      LAKER  CELtics    BULLs
 */
let nba = BiTNode(value: "NBA")
let west = BiTNode(value: "WestSec")
let east = BiTNode(value: "EastSec")
nba.letfChild = west
nba.rightChild = east

let lakers = BiTNode(value: "LAKERs")
//let spurs = BiTNode(value: "Spurs")
//west.rightChild = spurs
west.rightChild = lakers

let celtics = BiTNode(value: "CEltics")
let bull = BiTNode(value: "BULLs")
east.letfChild = celtics
east.rightChild = bull

let tree = BitTree(root: nba)
print(tree)

tree.preTraversal()
tree.preOrderIteration()
//tree.inTraversal()
print(" --- --- ---")
//tree.postTraversal()
//tree.inOrderIteration()
tree.postOrderIteration()






