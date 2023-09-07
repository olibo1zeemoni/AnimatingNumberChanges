//
//  DetailView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 07/09/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var person: Person
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
            VStack(alignment: .leading) {
                
                Text(person.name)
                    .background(.yellow)
                
                TextField("Name", text: $person.name)
                    .textFieldStyle(.roundedBorder)
             
                TextField("Age", text: $person.age)
                    .textFieldStyle(.roundedBorder)
              
                
            }
            .listRowSeparatorTint(.red, edges: .all)
            .padding()
        }
        .ignoresSafeArea()

    }
    
    private func isUserNameAvailable(username: String) -> Bool {
        if username.count < 6 {
            return false
        } else {
           return true
        }
    }
    
}

#Preview {
    DetailView(person: .constant(Person(name: "Kofi Sammy", age: "age")))
}
