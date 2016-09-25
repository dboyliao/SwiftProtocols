//
//  main.swift
//  CustomReflectable
//
//  Created by DboyLiao on 9/25/16.
//  Copyright © 2016 dboy. All rights reserved.
//

// `CustomReflectable` protocol can be used for better debugging
// printing when using lldb in XCode.
// Make a break point below and see how `po` in lldb looks like
// in this simple executalbe.
//
// Reference:
// - https://medium.com/@darjeelingsteve/easier-swift-debugging-with-mirrors-3b6e551f3c47#.smk2diilp

import Foundation

struct MyStruct:CustomReflectable {
    
    var coord:CGPoint
    var color:CGColor
    
    var customMirror: Mirror {
        
        let children = DictionaryLiteral<String, Any>(dictionaryLiteral: ("coord", self.coord), ("color", "\(self.color.colorSpace) \(self.color.components)"))
        return Mirror(self, children: children)
    }
}

let myStruct = MyStruct(coord: CGPoint(x:0, y:0), color: CGColor(red: 0.5, green: 0.3, blue: 0.1, alpha: 0.5))
print(myStruct)
