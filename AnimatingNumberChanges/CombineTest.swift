//
//  CombineTest.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 06/12/2023.
//

import Foundation
import SwiftUI
import Combine

class KeyboardViewModel: ObservableObject {
    @Published var inputText = ""
    private var cancellables = Set<AnyCancellable>()
    
    func addHello(_ text: String) {
        inputText += text
    }
    
    func delete(){
        guard !inputText.isEmpty else { return }
          inputText.removeLast()
    }
    
    init() {
        $inputText
            .sink { text in
                print("Input text: \(text)")
            }
            .store(in: &cancellables)
    }
}

struct CombineView: View {
    @StateObject var viewModel = KeyboardViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter text", text: $viewModel.inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            VStack {
                HStack {
                    Button(action: {
                        viewModel.addHello("A")
                    }, label: {
                        Text("A")
                    })
                    .buttonStyle(.bordered)
                    Button(action: {
                        viewModel.addHello("B")
                    }, label: {
                        Text("B")
                    })
                    .buttonStyle(.bordered)
                    Button(action: {
                        viewModel.addHello("C")
                    }) {
                        Text("C")
                    }
                    .buttonStyle(.bordered)
                    Button(action: {
                        viewModel.delete()
                    }) {
                        Label("delete", systemImage: "delete.left")
                            .labelStyle(.iconOnly)
                    }
                    .buttonStyle(.bordered)
                }
            }
        }
    }
}

#Preview(body: {
    CombineView()
})
