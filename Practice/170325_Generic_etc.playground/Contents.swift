
// Swift 잠깐 놀다 가기~♫

// 일시/ 장소: 2017.4.29/ 쿠단시타~♪

/* 목차
 1. 제너릭스(Generics)이란
 2. 간단 실습
 3. 번외: Array에 대해서 (feat 재은형)
 
 ------------------- 시간 되면 ------------------
 4. Swift3부터 생긴 argument 표기법 도대체 어떻게 하라고?
 5. Array 사용시 팁! map, flatMap을 활용해 소스코드를 좀 더 간단하게 짜기.(있어보이기)
 ----------------------------------------------
 
 6. 질의. 부제: 아는건 알랴주고 모르는건 못 알랴줌.
 */


/*
 참고
 - http://rhammer.tistory.com/121
 - https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Generics.html
 */

// -------------------------------------------------------------
// 1. 제네릭스(Generics)이란


// *공부하기전 전의 개념.*

// - 잘은 모르겠지만 <T>를 이용해서 형지정에서 좀 더 자유로워 질 수가 있는 듯.
// - func인 것 같은데 일반적인 func이랑 문법이 다름.
// - 굳이 사용을 안해도 크게 개발하는데 지장은 없어서 멀리하게 됨.


// *문서에 의거한 개념.*

// - 제너릭 코드를 사용하면 좀 더 유연하고 재사용률이 높은 함수를 만들 수 있다.
// - 코드 중복을 방지할 수 있고, 함수의 역할을 좀 더 명백히 전달 할 수 있다.


// -------------------------------------------------------------
// 2. 간단 실습

// *2-1 기본문법! 부제: <T>에 쫄지말자 *


// 기본형


// 결론: <T> 선언된 임시타입에 불과! 다양항 방식으로 정의가 될 수 있다.


// *2-2 응용1 옵션걸기 (Hashable Equatable Comparable)*


// *2-3 조건 걸기 (제너릭 프로토콜과 where 조건)*


// 제너릭 프로토콜은 associatedtype를 이용함. (굳이 필요는 없지만.. 제너릭 조건을 이용하기 위해선 써야하는 듯..)


// *3 번외: Swift의 Array에 대해서 (feat 재은형)*


// 실전 응용예
