### LinkedList_Swift3
SWIFT3 实现的一个双向链表
- [x] Node
   previous and next
- [x] LinkedList

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


- [x] LinkedList Copy-on-write
- [ ] TODO: Collection protocol

### SortPlayground
管可能多的作过程输出，很方便的看到各个算法的具体运行过程，方便查看

- [x] insertSort

- [x] selectSort

- [x] bubbleSort

- [x] quickSort: 最原始的实现方式，没有使用swift高级函数，个人感觉比较好理解

    ⚠️Warming：
Array in swift is a valued type， using `inout` make them refed, just like:

      ```swift
      let a = ["a", "b", "c"]
      func changed(arr: inout [String]) {
        	arr[1] = "bbbb"
        }
        changed( &a )
        print(a) // [a, bbb, c]
      ```
- [x] shellSort: 也是最原始的思路 -- 划定间隔获取数据，各自insertSort在综合insertSort
    使用break和continue来减少for-loop次数
- [x] mergeSort: 思路如下：
```
 [23, 7, 81, 5, 7, 14, 9, 55, 62, 74, 9]   
  ^      ^      ^      ^      ^       ^    
 [7, 23, 5, 81, 7, 14, 9, 55, 62, 74, 9]   
  ^             ^             ^    
 [5, 7, 23, 81, 7, 9, 14, 55, 9, 62, 74]  
  ^             ^             ^   
 [5, 7, 7, 9, 14, 23, 55, 81, 9, 62, 74]   
  ^                           ^
 [5, 7, 7, 9, 9, 14, 23, 55, 62, 74, 81]
```
分开来看的话
1 对于任意的相邻的已经有序的2段,如：
```
     前有序元素(i):      5, 7, 23, 81 ------中间元素为m
                  
desArr--排序后(k):   5, 7, 7, 9, 14, 23, 55, 81, 100, 111
                  
     后有序元素(j):      7, 9, 14, 55, 100, 111 
 
 j = m + 1
 
 如果i == m, 余下的j挪到desArr后面，即desArr[k] = 后[j]
 如果j == end, 余下的i挪到desArr后面，即desArr[k] = 前[i]
```
这样就完成了对任意2段已经有序的数据的排列

2 接下来进行分割，有2种思路，一种使用迭代，一种为递归
