//
//  main.swift
//  IteratorProtocol
//
//  Created by DboyLiao on 10/3/16.
//  Copyright © 2016 dboy. All rights reserved.
//

import Foundation

struct MyStruct {
    let name:String
    
    init(_ name: String) {
        self.name = name
    }
}

func makeIterator(values:[MyStruct]) -> MyIterator{
    return MyIterator(values)
}

struct MyIterator: IteratorProtocol {
    typealias Element = MyStruct
    
    private let elements:[Element]
    private var count = 0
    
    init(_ elements: [Element]){
        self.elements = elements
    }
    
    mutating func next() -> MyStruct? {
        if self.count < self.elements.count {
            let index = self.count
            self.count += 1
            return self.elements[index]
        }
        
        return nil
    }
}


let values:[MyStruct] = ["Dboy", "Qmal", "James"].map { MyStruct($0) }
var iterator = makeIterator(values: values)

while let my_struct = iterator.next() {
    print(my_struct.name)
}
