import UIKit

struct Person: Comparable {
    static func < (lhs: Person, rhs: Person) -> Bool {
        return (rhs.age - lhs.age ) > 0
    }
    
    var name: String
    var age: Int
}

//let a = Person(name: "A", age: 11)
//let b = Person(name: "B", age: 16)
//print("A < B : \(a<b)")

/**
    `inout`: 引用传递，调用时需配合`&`
    优化： flag无交换时 + 以排好无需遍历
 */
struct Bubble<T: Comparable> {
    
    static func sort(arr:inout [T]) {
        for i in (0..<arr.count).reversed() {
            var flag = false
            for j in (0..<i) {
                if greater(bElemnt: arr[j], sElement: arr[j+1]) {
                    flag = true
                    exChange(arr: &arr, x: j, y: j+1)
                }
            }
            print(" >> \(i) - \(arr)")
            
            if flag == false {
                break
            }
        }
    }
    
    private static func greater(bElemnt: T, sElement: T) -> Bool {
        return bElemnt > sElement
    }
    private static func exChange(arr: inout [T], x: Int, y: Int) {
        var temp: T
        temp = arr[x]
//        print("  \(temp) <-> \(arr[y])")
        arr[x] = arr[y]
        arr[y] = temp
    }
}

// [1, 2, 4, 3, 5]
//var arr = [1, 2, 3, 4, 5]
//Bubble.sort(arr: &arr)


struct Selection<T: Comparable> {
    
    static func sort(arr:inout [T]) {
        for i in 0..<arr.count {
            var min = i
//            print(" begin: min --> \(min)")
            for j in i..<arr.count {
                if greater(arr: &arr, bElm: min, sElm: j) {
                    min = j
//                    print(" >> min --> \(min)")
                }
            }
            exChange(arr: &arr, x: min, y: i)
            print("arr: \(arr)")

            if min == i {
                break
            }
        }
    }
    
    private static func greater(arr: inout [T], bElm: Int, sElm: Int) -> Bool {
//        print("  \(arr[bElm]) compare _\(arr[sElm])")
        return arr[bElm] > arr[sElm]
    }
    private static func exChange(arr: inout [T], x: Int, y: Int) {
        var temp: T
        temp = arr[x]
        print("  \(temp) <-> \(arr[y])")
        arr[x] = arr[y]
        arr[y] = temp
    }
}


struct InsertSort<T: Comparable> {
    static func sort(arr: inout [T]) {
        for i in 1..<arr.count {
            for j in (0..<i).reversed() {
//                print("\(i) -> \(j)")
                if greater(arr: &arr, bElm: j, sElm: j+1) {
                    exChange(arr: &arr, x: j, y: j+1)
                }else {
                    break;
                }
            }
//            print(arr)
        }
    }
    
    private static func greater(arr: inout [T], bElm: Int, sElm: Int) -> Bool {
        return arr[bElm] > arr[sElm]
    }
    private static func exChange(arr: inout [T], x: Int, y: Int) {
        var temp: T
        temp = arr[x]
        arr[x] = arr[y]
        arr[y] = temp
    }
}


var arr = [4, 5, 6, 3, 2, 1]
//Bubble.sort(arr: &arr)
//Selection.sort(arr: &arr)
//InsertSort.sort(arr: &arr)
