// Generics를 해보자.

// 아마 inout옵션은 값을 바꿀 때 쓰는 옵션인 듯.
func swapTwoInts( a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var aInt = 3
var bInt = 7

swapTwoInts(a: &aInt, &bInt)
aInt
bInt

// 그런데 이건 특정형만 쓸 수 있음. Float, Double, String 등 타입에 신경쓰지 말고 쓰고 싶다. 마치 obj-c의 NSObject?

// 기본형 func 펑션명<T>(파라메터) { ... } // <T>는 타입 파마메터
// <T>로 선언을 해줌으로서 이후에 타입 파라메터를 쓸 수 가 있게됨.
// 꼭 제너릭이 아닌 소스에서도 <>형으로 타입을 지정해서 쓰는 경우가 있다.
// -> 이거 알아볼 것 Dictionary<String, String>, let arr: Array<Int> = []

func swapTwoValues<T>(a: inout T, b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA

}

var a = 123
var b = 456
swapTwoValues(a: &a, b: &b)

a
b

// 그런데 이녀석 T말고 딴것도 쓸 수 있을까?
// 정답은 됨.
func swapValues<A>(a: inout A, b: inout A) {
    let temporaryA = a
    a = b
    b = temporaryA
    
}

var a1 = 123
var b1 = 789
swapTwoInts(a: &a1, &b1)

a1
b1


// 다만 파라메터의 형이 다르면 애러가 나옴.
// 그래서 이를 방지하기 위해서 옵션을 걸어 줄 수 있음.
/*
 Hashable
 Equatable
 Comparable
 */

/*
 응용편
 */
// <형> 은 swift에서는 선언을 해주는 거라고 볼 수 있음.
// TODO: 다만 이렇게 선언해주는 이유는 더 공부가 필요.
// Type parameter 타입을 쓰고 싶다면 struct에 이렇게 형을 선언해주고 쓰면 됨. <형>은 아무형이나 다 들어옴. 물론 Equatable 같은 옵션도 넣을 수 있음.
//
//struct Stack<Test: Equatable> {
//    
//    var items = [Test]()
//    
//    // TODO: mutating으로 해당 객체의 값의 변화가 일어나는 구문이 들어가게 되면 붙는데 더 공부가 필요
//    mutating func push (item: Test) {
//        items.append(item)
//    }
//    
//    mutating func pop() -> Test {
//        return items.removeLast()
//    }
//}

struct Stack<T: Equatable, JUN, 봉> {
    
    private var items = [T]()
    
    // TODO: mutating으로 해당 객체의 값의 변화가 일어나는 구문이 들어가게 되면 붙는데 더 공부가 필요
    mutating func push (item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
    
    var juns = [JUN]()
    var bongs = [봉]()
}

//let bong = Stack(items: [1, 2])
var bong = Stack<Int, Any, Any>.init()
bong.push(item: 1)
bong.push(item: 2)
bong.push(item: 3)

// 실제 swift 라이브러리내에 사용예
// let dic = Dictionary<String, Any>.init()

bong.pop()

bong.juns = [1, "2", 3, 4.0]

bong.juns


// 만약 일반적인 Struct라면 배열같은거에 Int라던지 Any, AnyObject 특정형을 써줘야 함. 써주기 싫으면 괜찮고.
// TODO: Any를 쓰면 되지 않느냐? 
// 반은 맞고 반은 틀리다고 봄. Any를 쓰면 다양한 형을 받을 수 있지만... 옵션을 걸지 못함. 예를 들어서 배열이긴한데 같은 형만 받고 싶은 옵션을 걸거나 where같은걸 이용해서 조건을 걸기가 좀 거시기함.






protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}


// 제너릭의 조건 where를 이용해서 조건을 붙여줄 수 있다.
// 보통 일반적인 where와는 달리 
// 파라메터로 받는 Type parameter의 형이 둘다 같거나 특정 타이프 파라메터의 형이 동일한 형이여야 한다는 등의 정도가 셋팅이 가능함.
// TODO: 파라메터로 받은 값들의 형이 같은지 비교를 하려면 protocol을 이용해서 associatedtype ItemType 를 이용해서 비교를 해야하는 것 같은데... 좀 더 공부가 필요.

// 이게 좀 짜증나는데.. 향후 개선 될 듯...
// TODO: 꼭 프로토콜을 이용하지 않고 하는 방법은 없는지? 확인 where 조건의 패턴을 확인할 것
func allItemsMatch1<J1: Container, J2: Container> (jun1: J1, jun2: J2) {
    
}

class 빵 {
    
    var name = "소보로"
    var shop = "빠리빠게뜨"
}

struct item1: Container {
    typealias ItemType = 빵
    private var items = [ItemType]()
    mutating func append(item: ItemType) {
        print(item.name)
        print(item.shop)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

//struct item1: Container {
//    private var items = [빵]()
//    mutating func append(item: 빵) {
//        print(item.name)
//        print(item.shop)
//    }
//    var count: Int {
//        return items.count
//    }
//    subscript(i: Int) -> 빵 {
//        return items[i]
//        
//    }
//}

func allItemsMatch2<J1: Container, J2: Container> (jun1: J1, jun2: J2) where J1.ItemType == J2.ItemType, J2.ItemType : Equatable, J1.ItemType: Hashable {
    
    
    
}



// TODO: 이 모든걸 응용할 수 있는 좋은 예제가 없을까?



