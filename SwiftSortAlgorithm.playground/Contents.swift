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

//let r1 = insertSort(arr: a)
//print(r1)
//
//let r2 = bubbleSort(arr: a)
//print(r2)
//
//let r3 = selectedSort(arr: a)
//print(r3)
//
//quickSort(arr: &a, start: 0, end: a.count-1)
//print(a)


/// give a stide, and insert, and last insert
/// using break and countinue reduce the for loop times， using x／y test
func shellSort(arr: inout [Int]) {
  
  var x = 0
  var y = 0
  var gap = arr.count / 2
  while gap > 0 {
    for i in 0 ..< arr.count {
      //      y += 1
      //      print("y :", y)
      
      if i + gap < arr.count {
        
        /// inserSort:  i and i+gap
        if arr[i] > arr[i+gap] {
          //          print("    ", arr[i], " *** ", arr[i+gap])
          let t = arr[i+gap]
          arr[i+gap] = arr[i]
          arr[i] = t
        }
        
        /// this last insert sort
        if gap == 1 && i > 0 {
          if arr[i-1] > arr[i] {
            let t = arr[i]
            arr[i] = arr[i-1]
            arr[i-1] = t
          }
        }else {
          continue
        }
      }else {
        break
      }
      //
      //      x += 1
      //      print(" x= ",  x)
    }
    
    gap /= 2
  }
  
}

//var shellArr = [49, 38, 65, 97, 26, 13, 27, 49, 55, 4]
//shellSort(arr: &shellArr)
//print(shellArr)

/// mergeOdered: 合并2个`有序`部分的数组， 以middel为界线元素下标，end等都是下标
func mergeOdered(arr: inout[Int], desArr: inout [Int], start: Int, middle: Int, end: Int) {
  
  var k = start
  // 只有一个元素
  if start == end {
//    print(" --- ", arr.count, desArr.count)
    desArr[start] = arr[start]
  }
  
  var i = start
  var j = middle+1
  print(i, j ,end)
  while (i <= middle && j <= end){
//    print("i: ", i, " j: ", j)
    if arr[i] < arr[j] {
      desArr[k] = arr[i]
      i += 1
      k += 1
    }else {
      desArr[k] = arr[j]
      j += 1
      k += 1
    }
    
    
//    print("yuxia: ", i, " j: ", j)

    if i > middle {
      while(j <= end) {
        desArr[k] = arr[j]
        k += 1
        j += 1
      }
    }else if j > end {
      while(i <= middle) {
        desArr[k] = arr[i]
        k += 1
        i += 1
      }
    }
//    print("  ", desArr)
  }
  
//  print("finally:  ", desArr)
}

/// 将按指定的gap为单位，让相邻的2组gap数据merge,如果余下不到gap保留，不到2gap就
func mergeStide(arr: inout [Int], mergedArr: inout [Int], gap: Int) {
  
  var n = arr.count
  var i = 0
  var s = gap
  
//   分割成最小[x, y] 在按2部分 mergeOdered
  while( i < n - 2 * s + 1){

//    print("i ",i, i+s-1, "merge", i+2*s-1)
    mergeOdered(arr: &arr, desArr: &mergedArr, start: i, middle: i+s-1, end: i+2*s-1)
  
    i += 2*s
  }

//  print(" > ", i, n, s)
  if(i <= n-s) {
//    print(" 超过一个gap 而不到 2个gap ", i, i+s-1, n-1)
    mergeOdered(arr: &arr, desArr: &mergedArr, start: i, middle: i+s-1, end: n-1)
  }else {
//    print(" 不到gap个数 ", arr)
    var k = i
    while k < n  {
//      print(" k 照搬 ", k)
      mergedArr[k] = arr[k]
      k += 1
    }
  }
}
// 合并大小为gap的数组
func mergeSort(arr: inout [Int]) {
  
  var desArr = Array(repeating: 0, count: arr.count)
  var gap = 1
  while gap < arr.count {
    
    mergeStide(arr: &arr, mergedArr: &desArr, gap: gap)
    gap *= 2
    print(" $$$$$$$$$$$$$$$$firstEnd:", desArr)
    mergeStide(arr: &desArr, mergedArr: &arr, gap: gap)
    gap *= 2
    print(" $$$$$$$$$$$$$$$$firstEnd:", arr)

  }
}
// start
var mergeArr = [23, 7, 81, 5, 7, 14, 9, 55, 62, 74, 9] // 1 ->
//var mergeArr = [7, 23, 5, 81, 7, 14, 9, 55, 62, 74, 9] // 2 ->
//var mergeArr = [5, 7, 23, 81, 7, 9, 14, 55, 9, 62, 74] // 4 ->
//var mergeArr = [5, 7, 7, 9, 14, 23, 55, 81, 9, 62, 74] // 8 ->
mergeSort(arr: &mergeArr)
