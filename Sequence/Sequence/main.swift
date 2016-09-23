//
//  main.swift
//  Sequence
//
//  Created by DboyLiao on 9/23/16.
//  Copyright © 2016 dboy. All rights reserved.
//

import Foundation

struct MyCollection:Sequence {
    
    var values:[Float]
    
    init(_ values:[Float]){
        self.values = values
    }
    
    // protocol requirements
    typealias Iterator = IndexingIterator<[Float]>
    typealias SubSequence = [Float]
    
    var underestimatedCount:Int {
        return self.values.count
    }
    
    func makeIterator() -> IndexingIterator<[Float]> {
        return self.values.makeIterator()
    }
    
    func map<T>(_ transform: (Float) throws -> T) rethrows -> [T] {
        var ret:[T]
        do {
            try ret = self.values.map(transform)
        }
        
        return ret
    }
    
    
    func filter(_ isIncluded: (Float) throws -> Bool) rethrows -> [Float] {
        var ret:[Float] = []
        do {
            print("filtering!")
            try ret = self.values.filter(isIncluded)
        }
        
        return ret
    }
    
    func forEach(_ body: (Float) throws -> Void) rethrows {
        for e in self.values {
            try body(e)
        }
    }
    
    func dropFirst(_ n: Int) -> [Float] {
        var ret:[Float] = []
        if n > self.values.count {
            return []
        }
        
        for i in n..<self.values.count {
            ret.append(self.values[i])
        }
        return ret
    }
    
    func dropLast(_ n: Int) -> Array<Float> {
        var ret:[Float] = []
        
        for i in 0..<self.values.count - n {
            ret.append(self.values[i])
        }
        
        return ret
    }
    
    func prefix(_ maxLength: Int) -> [Float] {
        if maxLength > self.values.count {
            return self.values
        }
        
        return [Float](self.values[0..<maxLength])
    }
    
    func suffix(_ maxLength: Int) -> Array<Float> {
        if maxLength > self.values.count {
            return self.values
        }
        
        let totalCount = self.values.count
        return [Float](self.values[totalCount-maxLength..<totalCount])
    }
    
    func first(where predicate: (Float) throws -> Bool) rethrows -> Float? {
        
        var ret:Float? = nil
        do {
            try ret = self.values.first(where: predicate)
        }
        
        return ret
    }
    
    func split(maxSplits: Int, omittingEmptySubsequences: Bool, whereSeparator: (Float) throws -> Bool) rethrows -> [[Float]] {
        let ret:[[Float]] = [[]]
        
        return ret
    }
}


let myCollect = MyCollection([Float]((2...30).map { Float($0) }))
for (i, e) in myCollect.enumerated() {
    if i < 10 {
        print(e)
    }
}

print(myCollect.prefix(10))
print(myCollect.prefix(2))
print(myCollect.suffix(5))
