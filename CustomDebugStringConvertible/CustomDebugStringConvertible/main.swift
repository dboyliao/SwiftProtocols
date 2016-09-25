//
//  main.swift
//  CustomDebugStringConvertible
//
//  Created by DboyLiao on 9/25/16.
//  Copyright © 2016 dboy. All rights reserved.
//

import Foundation

enum Gender:String{
    case male = "male"
    case female = "female"
}

class Person: CustomDebugStringConvertible, Equatable {
    
    var name:String
    var gender:Gender
    let SSN:String
    
    // CustomDebugStringConvertible
    var debugDescription: String {
        return "Person(name:\(self.name), gender:\(self.gender), SSN:\(self.SSN))"
    }

    init(name:String, gender:Gender, SSN:String){
        self.name = name
        self.gender = gender
        self.SSN = SSN
    }
    
    static func ==(lhs:Person, rhs:Person) -> Bool {
        return lhs.SSN == rhs.SSN
    }
}


let peter = Person(name:"Peter", gender:.male, SSN:"8391274974")
let tom = Person(name:"Tom", gender:.female, SSN:"938492732")
let spy = Person(name:"James", gender:.female, SSN:peter.SSN)

print(tom)

if peter == spy {
    print("Peter is a spy!")
}
