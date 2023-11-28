//
//  PersonView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 07/09/2023.
//

import SwiftUI
import SwiftData

struct PersonView: View {
    @Query var persons: [Person]
    //@State var somePersons = DataStore.persons
    //@State private var navigationPath: [Person] = []
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
            Text("Hello World")
            }
    
    private func addItem() {
        withAnimation {
            let newPerson = Person(name: "", age: "")
            modelContext.insert(newPerson)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(persons[index])
            }
        }
    }
    
}

#Preview {
    PersonView()
        .modelContainer(previewSampleData)
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
