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
    
    func height(node: BiTNode?) -> Int {
        
        if node == nil {
            return 0
        }else {
            print(node!.value)
            let i = height(node: node!.letfChild)
            let j = height(node: node!.rightChild)
            return (i<j) ? (j+1) : (i+1)
        }
    }
    
    init(root: BiTNode?) {
        self.root = root
    }
}


// ----- test

let nba = BiTNode(value: "NBA")
let west = BiTNode(value: "WestSec")
let east = BiTNode(value: "EastSec")
nba.letfChild = east
nba.rightChild = west

let lakers = BiTNode(value: "LAKERs")
let spurs = BiTNode(value: "Spurs")
west.letfChild = lakers
west.rightChild = spurs

//let celtics = BiTNode(value: "CEltics")
//let bull = BiTNode(value: "BULLs")
//east.letfChild = celtics
//east.rightChild = bull

let tree = BitTree(root: nba)
print(tree)

tree.height(node: tree.root)









