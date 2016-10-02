//
//  main.swift
//  Strideable
//
//  Created by DboyLiao on 10/3/16.
//  Copyright © 2016 dboy. All rights reserved.
//
// https://developer.apple.com/reference/swift/strideable

import Foundation

struct EvenNumber:Strideable {
    
    typealias Stride = Int
    
    private var value:Int
    private static func toEven(value:Int) -> Int {
        let mul:Int = value/2
        return 2 * mul
    }
    
    init(_ value: Int){
        self.value = EvenNumber.toEven(value: value)
    }
    
    func advanced(by n: Int) -> EvenNumber {
        let oldValue = self.value
        return EvenNumber(oldValue + 2 * n)
    }
    
    func distance(to other: EvenNumber) -> Int {
        return Int((self.value - other.value)/2)
    }
    
}

let evenNumber1 = EvenNumber(4)
let evenNumber2 = EvenNumber(8)

print(evenNumber1.advanced(by: 2))
print(evenNumber2.distance(to: evenNumber1))
