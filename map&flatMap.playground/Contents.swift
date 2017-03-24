//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let strings = ["1", "a", "2"]

// Map은 가공을 하는 역할
// 아래는 Map후 혹시 모를 nil체크로 필터링 -> Optional까지 벗기기
let numbers = strings.map { Int($0) } // Int형으로 캐스팅
    .filter { $0 != nil } // nil체크
    .map { $0! } // Optional을 벗기기

print(numbers)

// FlatMap은 옵셔널을 알아서 체크를 해주는 것 같은데?
// 기존의 map을 보완한 녀석인데... 딱히 nil을 체크해주는 것 말고는 없는 것 같다. 
// ->

//let possibleNumbers = ["1", "2", "three", "///4///", "5"]
//let mapped: [Int?] = numbers.map { str in Int(str) }
//// [1, 2, nil, nil, 5]
//let flatMapped: [Int] = numbers.flatMap { str in Int(str) }
//// [1, 2, 5]

// - 기본적으로 nil을 체크를 해주는 듯..
// -
let numbers2 = strings.flatMap { Int($0) }
    .map { "\($0)"}
let numbers3 = strings.map { Int($0) }
    .flatMap { $0}
//    .flatMap { "\($0)"}

print(numbers2)
print(numbers3)

// flatMap은 nil까지 체크를 해준다는 건가?

//paths.flatMap { NSData(contentsOfFile: $0) } // [String] -> [NSData]
//    .map { JSON(data: $0) }                         // [NSData] -> [JSON]
//    .flatMap { Item.fromJSON($0) }                  // [JSON] -> [Item]


// 번외편!

// 역으로 우리가 Array를 구현을 한다고 치면 대략 이런 느낌.
//var arr = Array<Any>.init()
//arr.append(<#T##newElement: Element##Element#>)

struct Arry<Element> {
    
    var items = [Element]()
    mutating func append(_ newElement: Element) {
        self.items.append(newElement)
    }

    mutating func append2(newElement: Element) {
        self.items.append(newElement)
    }

    mutating func append3(element1: Element, element2: Element) {
        self.items.append(element1)
    }
    
    mutating func append4(_ element1: Element, _ element2: Element) {
        self.items.append(element1)
    }

}

// func정의시 어규먼트는 어떻게 해야할까?
// https://swift.org/documentation/api-design-guidelines/#parameter-names

//var arr = Arry<Any>()
//arr.append2(newElement: <#T##Element#>)
//arr.append(<#T##newElement: Element##Element#>)
//arr.append3(element1: <#T##Element#>, element2: <#T##Element#>)
//arr.append4(<#T##element1: Element##Element#>, <#T##element2: Element##Element#>)
// 이런식으로 흉내는 가능.

// Swift.org의 가이드라인을 보면 Argument labels을 이런식으로 활용을 하라고 나옴.
func move(from start: CGPoint, to end: CGPoint) {
    
}

//move(from: <#T##CGPoint#>, to: <#T##CGPoint#>)
// 하지만 아직도 현장의 엔지니어들은 대부분 첫번째 패턴을 많이 씀.
func move2(start: CGPoint, end: CGPoint) {
    
}
//move2(start: <#T##CGPoint#>, end: <#T##CGPoint#>)

// 아직까지 이부분에 대해서는 뭐라고 할 수 없다.
// func를 정의 할 때 argument를 이용해서 좀 더 직관적으로 표현이 가능하다면 저렇게 하면 되고..
// 다만 예전 처럼 func를 정의 할 때 아규먼트를 func명에 포함시켜서 정의하는건 자제했으면 함.
// 애플의 의도는 이거임. 어규먼트를 파라메터쪽에 넣어서 좀 더 간결하게 func를 정의하자.
func getObjectWithParam(with param: Any) { }

struct Param {
    
}

func getObject(with param: Param) { }
getObject(with: Param())


//// 아직까지 API쪽도 다양한 형태가 존재하기 때문에 정답은 이거다라고는 말 못함.
//let str = NSString.init(string: "test")
//str.addingPercentEncoding(withAllowedCharacters: <#T##CharacterSet#>)
//str.append(<#T##c: Character##Character#>)
//str.append(contentsOf: <#T##Sequence#>)
//str.appendingFormat(<#T##format: String##String#>, <#T##arguments: CVarArg...##CVarArg#>)
//str.capitalized(with: <#T##Locale?#>)


let array = [Any]()
array.append(<#T##newElement: Any##Any#>)
array.append(contentsOf: <#T##S#>)


