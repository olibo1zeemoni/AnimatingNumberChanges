//
//  NewBirdIndicator.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 06/09/2023.
//

import SwiftUI

struct NewBirdIndicator: View {
    var body: some View {
        
        GeometryReader { geometry in
            let size = geometry.size
            PhaseAnimator(PhaseIndicator.allCases) { phase in
                
                Image(systemName: "bird.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geometry.size.width, height: geometry.size.height )
                    .frame(height: size.height)
                    .clipShape(Circle())
                    .foregroundStyle(.white)
                    .scaleEffect(phase == .highlighted ? 1.2 : 1)
                    .rotationEffect(phase == .highlighted ? Angle(degrees: -10) : .zero)
                    .padding(.leading, 10)
                    .background(in: Circle())
                    .backgroundStyle(.teal.gradient.opacity(phase == .highlighted ? 1.0 : 0.6))
                    .scaleEffect(phase == .highlighted ? 1.05 : 1.0)
            }
        }
        
    }
    
}

#Preview {
    NewBirdIndicator()
}


enum PhaseIndicator: CaseIterable {
    case idle
    case highlighted
}

