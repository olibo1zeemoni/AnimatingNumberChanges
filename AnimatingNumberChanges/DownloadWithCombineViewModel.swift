//
//  DownloadWithCombineViewModel.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 08/12/2023.
//

import Foundation
import SwiftUI
import Combine

struct PostElement: Codable, Identifiable {
    let userId, id: Int
    let title, body: String
}

typealias Post = [PostElement]

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts = Post()
    var cancellable = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
         URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .receive(on: DispatchQueue.main)
            .tryMap(handleResponse(output:)) //URLSession.DataTaskPublisher.Output)
            .decode(type: Post.self, decoder: JSONDecoder())
            ///.replaceError(with: []) replace with dummy data if error occurs, no completion required.
            .sink { (completion) in
                print(completion)
            } receiveValue: { [weak self] posts in
               // Thread.isMainThread
                //Thread.current.threadDictionary
                
                self?.posts = posts
            }
            .store(in: &cancellable)
        
    }
    
    func handleResponse(output: Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode == 200 else { throw URLError(.badServerResponse)}
        return output.data
    }
    
}
