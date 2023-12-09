//
//  ContentView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    
    var body: some View {
        
        NavigationStack {
            NavigationLink("secondView") {
                ListView()
            }
            TestTextfield(text: $text, keyType: UIKeyboardType.alphabet)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue, lineWidth: 4)
                )
        }
    }
}

#Preview {
    ContentView()
}
