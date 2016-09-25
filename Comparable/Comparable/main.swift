//
//  main.swift
//  Comparable
//
//  Created by DboyLiao on 9/25/16.
//  Copyright © 2016 dboy. All rights reserved.
//

import Foundation

struct WeirdNumber: Comparable, CustomStringConvertible {
    private let value:Int
    
    init(_ value:Int){
        self.value = value
    }
    
    // Comparable
    static func <(lhs:WeirdNumber, rhs:WeirdNumber) -> Bool {
        return lhs.value > rhs.value
    }
    
    static func >(lhs:WeirdNumber, rhs:WeirdNumber) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func ==(lhs:WeirdNumber, rhs:WeirdNumber) -> Bool {
        return lhs.value != rhs.value
    }
    
    // CustomStringConvertible
    var description: String {
        return "\(self.value)"
    }
}

let a = WeirdNumber(3)
let b = WeirdNumber(3)
let c = WeirdNumber(-1)

print("a: \(a), b: \(b), c: \(c)")
if a != b {
    print("a does not equal to b")
}

print("c > a: \(c > a)")
