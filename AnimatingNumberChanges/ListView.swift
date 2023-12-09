//
//  ListView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 08/12/2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var vm = DownloadWithCombineViewModel()
    
    var body: some View {
        List(vm.posts) {post in
            VStack{
                Text(post.title)
                    .font(.system(size: 12, weight: .bold, design: .default))
                Text(post.body)
            }
            .frame(maxWidth: .infinity)
            .listRowBackground(Color.red.opacity(0.2))
            .background(.secondary.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
}
