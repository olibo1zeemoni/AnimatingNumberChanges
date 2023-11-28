//
//  ContentView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 22/08/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var number: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Color.clear
                    .frame(width: 50, height: 50)
                    .animatingOverlay(for: number)
                
                Button {
                    withAnimation {
                        number = .random(in: 0 ..< 200)
                    }
                } label: {
                    Text("Create random number")
                }
                
                NavigationLink("Diagonal View") {
                    DiagonalView()
                }
                
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
