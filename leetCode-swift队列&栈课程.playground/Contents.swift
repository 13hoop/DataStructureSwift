import UIKit


/**
 *swift队列&栈课程-- https://leetcode-cn.com/leetbook/read/queue-stack/kzlb5/
*/


/**
 设计循环队列
 
 设计你的循环队列实现。 循环队列是一种线性数据结构，其操作表现基于 FIFO（先进先出）原则并且队尾被连接在队首之后以形成一个循环。它也被称为“环形缓冲器”。

 循环队列的一个好处是我们可以利用这个队列之前用过的空间。在一个普通队列里，一旦一个队列满了，我们就不能插入下一个元素，即使在队列前面仍有空间。但是使用循环队列，我们能使用这些空间去存储新的值。

 你的实现应该支持如下操作：

 - MyCircularQueue(k): 构造器，设置队列长度为 k 。
 - Front: 从队首获取元素。如果队列为空，返回 -1 。
 - Rear: 获取队尾元素。如果队列为空，返回 -1 。
 - enQueue(value): 向循环队列插入一个元素。如果成功插入则返回真。
 - deQueue(): 从循环队列中删除一个元素。如果成功删除则返回真。
 - isEmpty(): 检查循环队列是否为空。
 - isFull(): 检查循环队列是否已满。

 */
class MyCircularQueue1 {
    var arr: [Int] = []
    private var k: Int = 0
    private var currSum: Int = 0
    
    // 仔细思考，此处并非一定需要使用 可选类型，因为其既不会给空满状态判断增加便捷，还牺牲了代码结构上的便捷，引入了很多 if let
    private var frontIdx: Int?
    private var rearIdx: Int?
    /** Initialize your data structure here. Set the size of the queue to be k. */
    init(_ k: Int) {
        for _ in 0..<k {
            self.arr.append(0)
        }
        self.k = k
    }
    
    /** Insert an element into the circular queue. Return true if the operation is successful. */
    func enQueue(_ value: Int) -> Bool {
        guard currSum != k else {
            return false
        }
        
        if let las = rearIdx {
            let next = las + 1
            if next == k {
                rearIdx = 0
                arr[0] = value
            }else {
                arr[next] = value
                rearIdx = next
            }
        }else {
            arr[0] = value
            rearIdx = 0
            frontIdx = 0
        }
        
        currSum += 1
        return true
    }
    
    /** Delete an element from the circular queue. Return true if the operation is successful. */
    func deQueue() -> Bool {
        guard currSum != 0 else {
            return false
        }
        
        
        if let las = frontIdx {
            arr[las] = 0
            let next = las + 1
            if las == rearIdx! {
                frontIdx = nil
                rearIdx = nil
            }else if next == k {
                frontIdx = 0
            }else {
                frontIdx = next
            }
        }
        
        currSum -= 1
        return true
    }
    
    /** Get the front item from the queue. */
    func Front() -> Int {
        guard isEmpty() == false else {
            return -1
        }
        return arr[frontIdx!]
    }
    
    /** Get the last item from the queue. */
    func Rear() -> Int {
        guard isEmpty() == false else {
            return -1
        }
        return arr[rearIdx!]
    }
    
    /** Checks whether the circular queue is empty or not. */
    func isEmpty() -> Bool {
        return currSum == 0
    }
    
    /** Checks whether the circular queue is full or not. */
    func isFull() -> Bool {
        return currSum == k
    }
}


//let obj = MyCircularQueue1(3)
//let ret_1_0: Bool = obj.enQueue(1)
////print(obj.arr)
//let ret_1_2: Bool = obj.enQueue(2)
////print(obj.arr)
//let ret_1_3: Bool = obj.enQueue(3)
////print(obj.arr)
//let ret_1_4: Bool = obj.enQueue(4)
//print(obj.arr)
//
//obj.Rear()
//obj.isFull()
//let ret_2: Bool = obj.deQueue()
//print(obj.arr)
//let ret_2_1: Bool = obj.enQueue(4)
//print(obj.arr)
//obj.Rear()




/**
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 */
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        return -1
    }
    
    func findAll(_ s: String) {
        
        for i in 0..<s.count {
            
        }
    }
}

let s = Solution()
s.findAll("pwwkew")
