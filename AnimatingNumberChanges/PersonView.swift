//
//  PersonView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 07/09/2023.
//

import SwiftUI
import SwiftData

struct PersonView: View {
    //@Query var persons: [Person]
    @State var somePersons = DataStore.persons
    
    
    var body: some View {
        NavigationStack {
            List($somePersons) { $person in
                NavigationLink {
                    DetailView(person: $person)
                } label: {
                    HStack{
                        Text("name \(person.name)")
                        Spacer()
                        Text(person.age)
                    }
                }

                
            }
        }
    }
}

#Preview {
    PersonView()
        //.modelContainer(persistentMo)
}


struct DataStore {
    static var persons: [Person] = [
        Person(name: "Kofi", age: "twelve"),
        Person(name: "Kwasi", age: "two"),
        Person(name: "Kwame", age: "ten"),
        Person(name: "Ama", age: "eleven"),
        Person(name: "Abena", age: "nine"),
        Person(name: "Mary", age: "eight")
    ]
}
