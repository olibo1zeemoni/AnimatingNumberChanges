//
//  Person.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 07/09/2023.
//

import Foundation
import SwiftData

//@Model
class Person: ObservableObject, Identifiable {
    @Published var name: String
    @Published var age: String
    var id = UUID()
    
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
