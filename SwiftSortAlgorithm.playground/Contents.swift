/**
 all about Sort Algorithm
 */

// , 100, 23232, 2, 0, 99
var a = [5, 8, 3, 4, 6, 10, 7]

// 1-1 campare
func bubbleSort(arr: [Int]) -> [Int] {
  var r: [Int] = arr
  var t = 0
  for _ in 1 ..< r.count {
    for i in 1 ..< r.count {
      //      print(i, ": ", r[i], " ~ ", r[i-1])
      if r[i] < r[i-1] {
        t = r[i]
        r[i] = r[i-1]
        r[i-1] = t
      }
      //      print(r)
    }
//    print(" b ", r)
  }
  return r
}

/// alway have a sored tempArr
func insertSort(arr: [Int]) -> [Int] {
  var r: [Int] = arr
  var t = 0
  for i in 1 ... r.count {
    //    print(" i=", i , " -> ", r[0...i-1])
    for j in 0 ..< i-1 {
      //      print("   ", j, ": ",r[j], " ~ ", r[i-1] )
      if r[j] > r[i-1] {
        t = r[i-1]
        r[i-1] = r[j]
        r[j] = t
      }
    }
//    print("  i ", r)
  }
  return r
}

/// always find the most one, an make the one order
func selectedSort(arr: [Int]) -> [Int] {
  var r = arr
  var t = 0
  for j in 0 ..< r.count {
    var most = r[j]
    for i in j+1 ..< r.count {
      //      print("   ", min, " ~ ", r[i] )
      if most < r[i] {
        t = most
        most = r[i]
        r[i] = t
      }
      r[j] = most
      //      print(min)
    }
//    print("s", r)
  }
  return r
}


/// quich sort
func quickSort(arr: inout [Int], start: Int, end: Int) {
  guard start < end else {
    return
  }
  
  let middle = getMiddle(arr: &arr, start: start, end: end)
  // 2 middle left range do the same
//  print(" middle is", middle, " ~ ", arr)
  quickSort(arr: &arr, start: 0, end: middle-1)
  // 3 middle right range do the same
  quickSort(arr: &arr, start: middle+1, end: end)
}


// always get the certain middle
private func getMiddle(arr: inout [Int], start: Int, end: Int) -> Int {
  let pivot = arr[end]
  
  var left = start
  var right = end - 1
  while true {
//          print("I", left, " compare ", right)
    while(left < end && arr[left] <= pivot) {
      left += 1
    }
    
    if left == end {
      break
    }
    
    while(start <= right && arr[right] > pivot) {
      right -= 1
    }
    
//          print("II ", left, " compare ", right)
    if left < right {
      let t = arr[right]
      arr[right] = arr[left]
      arr[left] = t
//      print(arr)
    }else {
//              print(" xxx ", arr[left], " change ", arr[end])
      let d = arr[left]
      arr[left] = arr[end]
      arr[end] = d
      break
    }
  }
  
//  print("> ", arr)
  return left
}

let r1 = insertSort(arr: a)
print(r1)

let r2 = bubbleSort(arr: a)
print(r2)

let r3 = selectedSort(arr: a)
print(r3)

quickSort(arr: &a, start: 0, end: a.count-1)
print(a)

