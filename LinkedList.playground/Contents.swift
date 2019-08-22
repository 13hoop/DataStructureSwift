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
func creatALinklist() -> ListNode?{
    
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
    node7.next = node3

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
func checkoutCircleNode(head: ListNode?) -> ListNode? {
    
    
    return nil;
}


//---------------------------     ---------------------------|
//                         test here                         |
//---------------------------     ---------------------------|
var linkList = creatALinklist()
//printLinkList(head: linkList)

checkoutCircle(head: linkList)


