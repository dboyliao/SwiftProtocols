//
//  main.swift
//  ExpressibleByStringInterpolation
//
//  Created by DboyLiao on 10/2/16.
//  Copyright © 2016 dboy. All rights reserved.
//
// Reference: https://github.com/apple/swift/blob/4a24b069e0388cdac02551cda06a0d0ef1298436/test/stdlib/Inputs/PrintTestTypes.swift
import Foundation

struct MyString : ExpressibleByStringInterpolation, CustomStringConvertible{
    
    var value: String
    var description: String {
        return self.value
    }
    
    init(str: String) {
        self.value = str
    }
    
    init(stringInterpolation strings: MyString...) {
        var result = ""
        for s in strings {
            result += s.value
        }
        self.init(str: result)
    }
    
    init<T>(stringInterpolationSegment expr: T) {
        self.init(str: "<segment: '" + String(describing: expr) + "'>")
    }
}

let greet = "hello"
let name = "Dboy"
let message:MyString = "\(greet), \(name)"
print(message)

// Another way
struct MyString2:CustomStringConvertible {
    
    var value:String
    
    var description: String {
        return "<segment: '" + self.value + "'>"
    }
    
    init(_ str: String){
        self.value = str
    }
}

let greet2 = MyString2("hello")
let name2 = MyString2("Dboy")
let message2 = "\(greet2)\(MyString2(", "))\(name2)"
print(message2)
