//: Playground - noun: a place where people can play

import UIKit

//, =, -, +, !, *, %, <, >, &, |, ^, or ~
protocol Type {
    static func +(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self
}

extension Double: Type {}
extension Int: Type {}
extension CGFloat: Type {}

precedencegroup AdditionPrecedence {
    associativity: left
    higherThan: RangeFormationPrecedence
}

infix operator ⊕ : AdditionPrecedence
func ⊕<T: Type>(lhs: T, rhs: T) -> T {
    return lhs + rhs
}

infix operator -- : AdditionPrecedence
func --<T: Type>(lhs: T, rhs: T) -> T {
    return lhs - rhs
}

precedencegroup MultiplicationPrecedence {
    associativity: left
    higherThan: AdditionPrecedence
}

infix operator ** : MultiplicationPrecedence
func **<T: Type>(lhs: T, rhs: T) -> T {
    return lhs * rhs
}

infix operator /? : MultiplicationPrecedence
func /?<T: Type>(lhs: T, rhs: T) -> T {
    return lhs / rhs
}

let name = "preeti"
let a:Int = 2
let b:Int = 3


/* Use
 *  ⊕ for Addition
 *  -- for subtraction
 *  ** for multiplication
 *  /? for division
 */

1⊕2
1.5⊕2.6
4--1
2--4**8
4/?4
