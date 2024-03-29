import UIKit

class ListNode {
    var val: Int?
    var next: ListNode?
    init(value: Int?) {
        self.val = value
    }
}

class YRList {
    public typealias Node = ListNode
    var head: Node?
    var count: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }
    public var first: Node? {
        return head
    }
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    init(node: Node?) {
        self.head = node
    }
    
}

// MARK: ---------------- 001. 创建list
func creatALinklist() -> ListNode? {
    
    let node0: ListNode = ListNode(value: -3)
    let node1: ListNode = ListNode(value: -2)
    let node2: ListNode = ListNode(value: -1)
    let node3: ListNode = ListNode(value: 0)
    let node4: ListNode = ListNode(value: 1)
    let node5: ListNode = ListNode(value: 2)
    let node6: ListNode = ListNode(value: 3)
    let node7: ListNode = ListNode(value: 4)

    let head = node0
    head.next = node1
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    node6.next = node7
    node7.next = nil

//    let head = node3
//    head.next = node2
//    node2.next = node0
//    node0.next = node1
//    node1.next = node2
//    node4.next = node5
//    node5.next = node6
//    node6.next = node7
//    node7.next = node0

    
    return head;
}

// MARK: ---------------- 002. 打印list
func printLinkList(head: ListNode?) {
    guard head != nil else {
        print("XXX----  is empty list here -----XXX")
        return
    }
    
    var walkN: ListNode? = head
    var fast = walkN
    var i: Int = 0;
    while walkN != nil {
        print("[\(i)] -> \(String(describing: walkN?.val))  ~ \(String(describing: fast?.val))\n")
        walkN = walkN?.next
        fast = fast?.next?.next
        i += 1
        
        if i > 25 {
            break
        }
    }
}

// MARK:  ---------------- 003. 检测是否有环
func checkoutCircle(head: ListNode?) -> Bool {
    
    guard head != nil else {
        return false
    }
    
    var slow = head
    var fast = slow!.next
    var i = 0
    while slow != nil {
        
//        print("[\(i)] -> \(String(describing: slow?.val))  ~ \(String(describing: fast?.val))\n")
        if fast == nil {
            return false
        }
        
        if slow! === fast! {
            return true
        }else {
            slow = slow?.next
            fast = fast?.next?.next // 如果是在Java中实现，由于给 Null对象发消息， 会报异常
        }
        i += 1
    }

    return false
}

// MARK:  ---------------- 004. 检测是否有环，并返回入环节点，如果无环返回 nil
func getMeetingPoint(head: ListNode?) -> ListNode? {
    guard head != nil else {
        return nil
    }
    var slow = head
    var fast = slow
    
    while slow != nil && fast != nil {
        
//        print(" -> \(String(describing: slow!.val))  ~ \(String(describing: fast!.val))\n")
        
        slow = slow!.next
        fast = fast!.next?.next

        if slow === fast {
            return slow
        }

    }
    return nil
}

func checkoutCircleNode(head: ListNode?) -> ListNode? {

    guard let meet = getMeetingPoint(head: head) else {
        return nil
    }
    
    var tortoise = head!
    var hare = meet
    
//    var i = 0
    while true {
        print(" -> \(String(describing: tortoise.val))  ~ \(String(describing: hare.val))\n")
        tortoise = tortoise.next!
        hare = hare.next!
        if tortoise === hare {
            return tortoise
        }
    }
}


// MARK:  ---------------- 005. 单交叉链表
func getMeetNodeWhenCrossed(headA: ListNode?, headB: ListNode?) -> ListNode? {
    
    var nodeA = headA
    var arr: [ListNode] = []
    while nodeA != nil {
        arr.append(nodeA!)
        print("\(String(describing: nodeA!.val))")
        nodeA = nodeA?.next
    }
    
    var nodeB = headB
    while nodeB != nil {
        if arr.contains(where: { (value) -> Bool in
//            print(" --- value > \(String(describing: value.val))  compare  \(String(describing: nodeB?.val))")

            if value === nodeB {
                return true
            }else {
                return false
            }
        }) {
            print(" -vvvv- > \(String(describing: nodeB?.val))")
            return nodeB
        }
        nodeB = nodeB?.next
    }
    
    return nil
}


// MARK:  ---------------- 006. 删除链表中指定的倒数第N个节点
func removeNthFromEnd(head: ListNode?, idx: Int) -> ListNode? {
    
    var walk: ListNode? = head
    var arr = [ListNode]()

    var i = 0;
    while walk != nil {
        arr.append(walk!)
        print("-[\(i)]-  walk:\(String(describing: walk?.val))")

        walk = walk?.next;
        i += 1
    }
    
    
    let x = arr[i-idx]
    print("-x-  walk:\(String(describing: x.val))")
    if(arr.count - idx >= 1) {
        let preX = arr[i-idx-1]
        preX.next = x.next
        

        return head
    }else {
        return x.next
    }

    return nil
}


// MARK:  ---------------- 007. reverse
//func reverse(head: ListNode?) -> ListNode? {
//
//    func swap(x: ListNode?, y ListNode?) {
//
//    }
//
//
//    var pre:ListNode? = nil
//    var walk = head
//    while walk != nil {
//        let temp = walk?.next
//        walk?.next = pre
//        pre = walk
//        walk = temp
//    }
//
//    return pre
//}
//---------------------------     ---------------------------|
//                         test here                         |
//---------------------------     ---------------------------|

//var linkList = creatALinklist()                       // 001
//printLinkList(head: linkList)

//checkoutCircle(head: linkList)                        // 002

//var a = getMeetingPoint(head: linkList)               // 003
//print(" Meeting P is \(String(describing: a?.val))")

// 004
//if let cirleP = checkoutCircleNode(head: linkList) {
//    print(" circled at \(String(describing: cirleP.val))")
//}else {
//    print(" --> here no cirle ")
//}



// 005
//let nodeA0: ListNode = ListNode(value: -14)
//let nodeA1: ListNode = ListNode(value: -13)
//let nodeA2: ListNode = ListNode(value: -12)
//let nodeA3: ListNode = ListNode(value: -11)
//
//let node0: ListNode = ListNode(value: -3)
//let node1: ListNode = ListNode(value: -2)
//let node2: ListNode = ListNode(value: -1)
//let node3: ListNode = ListNode(value: 0)
//let node4: ListNode = ListNode(value: 1)
//let node5: ListNode = ListNode(value: 2)
//let node6: ListNode = ListNode(value: 3)
//let node7: ListNode = ListNode(value: 4)
//
//let head2 = node0
//head2.next = node1
//node1.next = node2
//node2.next = node3
//node3.next = node4
//node4.next = node5
//node5.next = node6
//node6.next = node7
//node7.next = nil
//
////let head1 = nodeA0
////nodeA0.next = nodeA1
////nodeA1.next = nodeA2
////nodeA2.next = nodeA3
////nodeA3.next = node3
////
////let linkListA = head1
////let linkListB = head2
////let r = getMeetNodeWhenCrossed(headA: head1, headB: head2)
//
//
//removeNthFromEnd(head: node0, idx: 8)


// -------------- -------- new version ------- -------------

class MyLinkedList {

    class Node {
        var val: Int
        var nextN: Node?
        var preN: Node?
        init(value: Int) {
            self.val = value
        }
    }
    
    open var count: Int = 0
    open var headN: Node?
    open var tailN: Node?

    init() {
        headN = nil
        tailN = nil
    }
    
    func get(_ index: Int) -> Int {
        let curr = getNode(index)
        return (curr != nil) ? curr!.val : -1
    }
    func getNode(_ index: Int) -> Node? {
        guard index < count else {
            return nil
        }

        var s = 0
        var currN = headN
        while currN != nil {
            if index == s {
                break
            }

            currN = currN?.nextN
            s += 1
        }
        return currN
    }
    
    func addAtHead(_ val: Int) {
        let node = Node(value: val)
        count += 1
        guard count != 0 else {
            headN = node
            tailN = node
            return
        }
        
        node.nextN = headN
        headN = node
    }
    
    func addAtTail(_ val: Int) {
        let node = Node(value: val)
        guard count != 0 else {
            headN = node
            tailN = node
            count += 1
            return
        }

        var curr = headN
        while curr != nil {
            if curr?.nextN == nil {
                tailN = curr
                break
            }
            curr = curr!.nextN
        }

        tailN!.nextN = node
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        let node = Node(value: val)
        guard index <= count else {
            print("\(index) index out of NodeList Range in 0..<\(count)")
            return
        }
        
        if index == count-1 {
            addAtTail(val)
        }else if index == 0 {
            addAtHead(val)
        }else {
            let temp = getNode(index-1)
            node.nextN = temp?.nextN
            temp?.nextN = node
            count += 1
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        guard index < count else {
            print("\(index) index out of NodeList Range in 0..<\(count)")
            return
        }
        
        if index == 0 {
            headN = headN?.nextN
        }else {
            let temp = getNode(index)
            let preN = getNode(index-1)
            preN?.nextN = temp?.nextN
            temp?.nextN = nil
        }
    }
    
    func printList() {
        var str = "Node list:"
        var curr = headN
        while curr != nil {
            str += " -> (\(curr!.val))"
            curr = curr?.nextN
        }
        print(str)
    }
}

func testN001() {
    let myLinkedList: MyLinkedList = MyLinkedList()
    myLinkedList.addAtHead(1)
    myLinkedList.addAtTail(3)
    myLinkedList.addAtIndex(1, 2)
    myLinkedList.get(1)
    myLinkedList.printList()

    myLinkedList.deleteAtIndex(1)
    myLinkedList.get(1)
    myLinkedList.printList()
}
//testN001()

func testN002() {
    let myLinkedList: MyLinkedList = MyLinkedList()
    myLinkedList.addAtHead(7)
    myLinkedList.addAtTail(7)
    myLinkedList.addAtHead(9)
    myLinkedList.addAtTail(8)
    myLinkedList.addAtHead(6)
    myLinkedList.addAtHead(0)
    myLinkedList.get(5)
    myLinkedList.printList()


//    myLinkedList.addAtHead(0)
//    myLinkedList.get(2)
//    myLinkedList.get(5)
//    myLinkedList.addAtTail(4)
//    myLinkedList.printList()
}
testN002()
