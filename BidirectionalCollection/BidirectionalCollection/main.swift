//
//  main.swift
//  BidirectionalCollection
//
//  Created by DboyLiao on 9/23/16.
//  Copyright © 2016 dboy. All rights reserved.
//

import Foundation

struct MyCollection: BidirectionalCollection {
    
    private var values:[Float]
    
    init(_ values:[Float]){
        self.values = values
    }
    
    // Collection
    typealias Iterator = [Float]
    typealias SubSequence = [Float]
    typealias IndexDistance = Int
    typealias Indices = [Int]
    
    var first:Float? {
        get {
            if self.values.count > 0 {
                return self.values[0]
            }
            return nil
        }
    }
    
    var isEmpty: Bool {
        return self.values.count == 0
    }
    
    var count:Int {
        return self.values.count
    }
}

