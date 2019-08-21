import UIKit

// 001 ---------- Hailstone Sequence
/**
 def:
    n <= 1 : {1}
    n 偶   :  {n} U Hailstone( n/2 )
    n 奇   :  {n} U Hailstone( 3n+1 )
 
 */


// 002 ---------- 最大子序列和
//     | -> 002.1 暴力式： 得到所以的子序列，娶个子序列和的最大值
func sum(i: Int, j: Int, arr: [Int]) -> Int {
    var r = 0
    for idx in i...j {
        r += arr[idx]
        
        print("                ~ [\(i+idx) + \(j)]   =>  \(r)")

    }
    return r
}

let arr: [Int] = [-2, 11, -4, 13, -5, -2]
var maxV = 0
for i in 0..<arr.count {
    let start = arr[i]
    print("start [\(start)]")
    for j in i..<arr.count {
        maxV = max(maxV, sum(i: i, j: j, arr: arr))
        print("         - end [\(arr[j])]  => \(maxV)")
    }
}
maxV


