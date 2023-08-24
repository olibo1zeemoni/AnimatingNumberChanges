//
//  DiagonalView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 24/08/2023.
//

import SwiftUI

struct DiagonalView: View {
    
    @State var name = ""
    @State var password = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                Text("Login")
                    .font(.custom("Avenir Next", size: 40))
                    .frame(maxWidth: .infinity)
                    .padding(.leading, -150)
                    .padding(.bottom, 2)
                    .fontWeight(.bold)
                    .rotationEffect(Angle(degrees: 35))
                Group {
                    TextField("Username", text: $name)
                    TextField("Password", text: $password)
                }
                // .padding()
                .frame(height: 80)
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.gray)
                .cornerRadius(20)
                .padding([.top,.bottom], 12)
                .multilineTextAlignment(.center)
                .rotationEffect(Angle(degrees: 35))
                
                Button {
                    
                } label: {
                    Text("Login")
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding([.top,.bottom], 15)
                        .multilineTextAlignment(.center)
                        .rotationEffect(Angle(degrees: 35))
                    
                }
                
                Text("or")
                    .foregroundColor(.gray)
                    .padding(.leading, -50)
                    .rotationEffect(Angle(degrees: 35))
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .frame(maxWidth: .infinity, maxHeight: 80)
                        .foregroundColor(.blue)
                        .padding(.bottom, 15)
                        .padding(.leading, -150)
                        .rotationEffect(Angle(degrees: 35))
                    
                }
                
                Spacer()

                HStack {
                    Button {
                        
                    } label: {
                        Text("Terms")
                        
                    }
                    
                    Text("and")
                    
                    Button {
                        
                    } label: {
                        Text("Privacy")
                        
                    }
                }
                .font(.subheadline)
                .padding(.leading, -200)
                .rotationEffect(Angle(degrees: 35))
            }
            .font(.system(size: 25, weight: .regular, design: .default))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .frame(width: 30, height: 30)
                            .background(Color.blue.opacity(0.2))
                            .foregroundColor(.blue)
                            .cornerRadius(20)
                            .rotationEffect(Angle(degrees: 30))
                            .padding([.top, .leading], -60)
                        
                    }
                    
                }
                
            }
        }
        
    }
}

struct DiagonalView_Previews: PreviewProvider {
    static var previews: some View {
        DiagonalView()
    }
}


struct User  {
     var userName: String
     var password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
}


class ViewModel: ObservableObject {
    
        @Published var users: [User] = [
        User(userName: "Kwaku", password: "Manu"),
        User(userName: "Kofi", password: "Owusu"),
        User(userName: "Yaw", password: "Buabeng")

]
}

