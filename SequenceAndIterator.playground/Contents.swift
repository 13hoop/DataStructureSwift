import Foundation

/* 
 -----------  关于Sequence 和 Iterator 的补充 -------------
 
 在swift3之后,原本的`generatorType跟sequenceType`被同意命名为`Iterator 和 Sequence`
 
 Iterator 迭代，即序列的访问集合中元素的行为模式，在swift中对应协议：
 ```swift
 protocol IteratorProtocol {
  associatedtype: Element
  mutating func next() -> Element?
 }
 */

struct Beer {
  var brandName: String // 品牌
  var volume: Int       // 容量
}

// 啤酒柜台
struct BeerContainer {
  let elments: [Beer]
  var i = 0
  init(elments: [Beer]) {
    self.elments = elments
  }
}
extension BeerContainer: IteratorProtocol {
  typealias Element = Beer
  mutating func next() -> Beer? {
    // 这里是defer关键字的一个绝佳的使用场合
    defer {
      i = i + 1
      print(" -- \(i)")
    }
    print(" - \(i)")
    return elments[i]
  }
}

let aOrionBeer = Beer(brandName: "Orion", volume: 300)
let aSaporoBeer = Beer(brandName: "Saporo", volume: 380)
let aTaiwanBeer = Beer(brandName: "TaiwanBeer", volume: 330)
let aAsahiBeer = Beer(brandName: "Asahi", volume: 420)

var aBeerContainer = BeerContainer(elments: [ aOrionBeer, aSaporoBeer, aTaiwanBeer, aAsahiBeer ])

while let aBeer = aBeerContainer.next() {
  print(aBeer)
}
