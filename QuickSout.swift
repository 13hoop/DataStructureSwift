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

let a = [3, 4, 56, 88, 0, 10]
quickSort(arr: &a, start: 0, end: a.count-1)
print(a)