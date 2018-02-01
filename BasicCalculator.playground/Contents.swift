//: Playground - noun: a place where people can play

import UIKit
///, =, -, +, !, *, %, <, >, &, |, ^, or ~
protocol Type {
    static func %(lhs: Self, rhs: Self) -> Self
    static func &(lhs: Self, rhs: Self) -> Self
    static func |(lhs: Self, rhs: Self) -> Self
    static func ^(lhs: Self, rhs: Self) -> Self
}

//extension Double: Type {}
//extension Int: Type {}
//extension CGFloat: Type {}

//func @(lhs: String, rhs: Int) -> String {
//        var result = lhs
//    for _ in 2...rhs {
//        result += lhs
//    }
//    return result
//}

let name = "preeti"
//name@5

