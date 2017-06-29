/**
 all about Sort Algorithm
 */

let a = [5, 8, 3, 4, 6, 4, 100, 23232, 2, 0, 99]

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
    print(" b ", r)
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
    print("  i ", r)
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
    print("s", r)
  }
  return r
}
insertSort(arr: a)
bubbleSort(arr: a)
selectedSort(arr: a)
