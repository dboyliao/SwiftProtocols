//
//  main.swift
//  ExpressibleByNilLiteral
//
//  Created by DboyLiao on 10/3/16.
//  Copyright © 2016 dboy. All rights reserved.
//
// https://github.com/apple/swift/blob/045bc16b6d7d6a9dbd3e08b5943d9fefca4a194a/stdlib/public/core/ImplicitlyUnwrappedOptional.swift
// https://developer.apple.com/reference/swift/expressiblebynilliteral

import Foundation

struct MyStruct:ExpressibleByNilLiteral {
    
    var value:Int
    
    init(nilLiteral: ()) {
        print("nil constructor invoked!")
        self.value = 0
    }
}

// what!? @@
let nilValue:MyStruct = nil

if nilValue.value == 0 {
    print("nil!!")
}
