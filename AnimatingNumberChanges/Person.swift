//
//  Person.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 07/09/2023.
//

import Foundation
import SwiftData

@Model
class Person {
     var name: String
     var age: String
    @Relationship(.unique) var id = UUID()
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
