//
//  main.swift
//  AbsoluteValuable
//
//  Created by DboyLiao on 9/22/16.
//  Copyright © 2016 dboy. All rights reserved.
//
import Foundation

struct MyInteger:AbsoluteValuable {
    
    var value:Int = 0
    
    init(_ value:Int){
        self.value = value
    }
    
    // AbsoluteValuable
    static func abs(_ x: MyInteger) -> MyInteger {
        var ret:MyInteger
        if x.value < 0 {
            ret = MyInteger(-x.value)
        } else {
            ret = MyInteger(x.value)
        }
        
        return ret
    }
    
    // SignedNumber
    prefix public static func -(x: MyInteger) -> MyInteger {
        return MyInteger(-x.value)
    }
    
    public static func -(lhs: MyInteger, rhs: MyInteger) -> MyInteger {
        return MyInteger(lhs.value - rhs.value)
    }
    
    // Comparable
    static func <(lhs: MyInteger, rhs: MyInteger) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func <=(lhs: MyInteger, rhs: MyInteger) -> Bool {
        return lhs.value <= rhs.value
    }
    
    static func >=(lhs: MyInteger, rhs: MyInteger) -> Bool {
        return lhs.value >= rhs.value
    }
    
    static func >(lhs: MyInteger, rhs: MyInteger) -> Bool {
        return lhs.value > rhs.value
    }
    
    // ExpressibleByIntegerLiteral
    typealias IntegerLiteralType = Int
    
    public init(integerLiteral value: Int){
        self.value = value
    }
    
    // Equatable
    static func ==(lhs: MyInteger, rhs: MyInteger) -> Bool {
        return lhs.value == rhs.value
    }
    
    init(_ x:MyInteger){
        self.value = x.value
    }
}

let a = MyInteger(-3)
let b = abs(a)
let c = MyInteger(a)

print("a: \(a)")
print("b: \(b)")
print("c: \(c)")

if a == c {
    print("Equal!!")
}

if a > b {
    print("a is larger")
} else {
    print("b is larger")
}
