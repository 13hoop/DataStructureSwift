## LinkedList_Swift3
SWIFT3 实现的一个双向链表
----

### Node
- previous and next

### LinkedList
- iterator: `Sequence` and `IteratorProtocol`
- count
- append / remove
- nodeAt / valueAt

`Sequence`: 非常基础的一个数据组合类型， A type that provides sequential, iterated access to its elements. It gives you access to a large number of operations like: check a particular value using for-in loop
```swift
// contain功能
let bugs = ["Aphid", "Bumblebee", "Cicada", "Damselfly", "Earwig"]
var hasMosquito = false
for bug in bugs {
  if bug == "Mosquito" {
    hasMosquito = true
    break
  }
}
print("'bugs' has a mosquito: \(hasMosquito)") // Prints "'bugs' has a mosquito: false"

// ->
if bugs.contains("Mosquito") {
  print("Break out the bug spray.")
} else {
  print("Whew, no mosquitos!")
}
// Prints "Whew, no mosquitos!"
```
  
### LinkedList Copy-on-write

### TODO: Collection protocol
