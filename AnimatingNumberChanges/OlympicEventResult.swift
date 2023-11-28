//
//  File.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 03/11/2023.
//

import SwiftUI

struct OlympicEventResult: Codable {
    var goldWinner: String
    var silverWinner: String
    var bronzeWinner: String
}



struct JsonView: View {
    
    let json = """
    {
        "silver_winner": "Sound",
        "gold_winner": "Light",
        "bronze_winner": "Unladen Swallow"
    }
    """.data(using: .utf8)!


   
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
            .onAppear{ decodeAndPrint()}
    }
    
    func decodeAndPrint(){
        let decoder = JSONDecoder()
        let decodeAndPrint = { print(try! decoder.decode(OlympicEventResult.self, from: json)) }
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decodeAndPrint()
    }
}

#Preview {
    JsonView()
}
