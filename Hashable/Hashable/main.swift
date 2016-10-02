//
//  main.swift
//  Hashable
//
//  Created by DboyLiao on 10/3/16.
//  Copyright © 2016 dboy. All rights reserved.
//

import Foundation

struct MyHashable: Hashable {
    
    var value:Int
    
    init(_ value:Int){
        self.value = value
    }
    
    var hashValue: Int {
        return self.value + 1
    }
    
    static func ==(lhs: MyHashable, rhs: MyHashable) -> Bool {
        return lhs.value == rhs.value
    }
}


let hashable1 = MyHashable(3)
let hashable2 = MyHashable(4)

let dict = [hashable1: "3", hashable2:"4"]

for (key, value) in dict {
    print("key: \(key)")
    print("value: \(value)")
}

let list = [hashable1, hashable2]

if list.contains(MyHashable(10)) {
    print("contains!")
} else {
    print("not contains....")
}
