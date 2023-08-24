//
//  AnimatableNumberModifier.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 22/08/2023.
//

import SwiftUI

struct AnimatableNumberModifier: AnimatableModifier {
    var number: Int
    //Usually a double, Int conforms to VectorArithmetic
    
    var animatableData: Int {
        get { number }
        set { number = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Text("\(number)")
            )
    }
}

extension View {
    func animatingOverlay(for number: Int) -> some View {
        modifier(AnimatableNumberModifier(number: number))
    }
}


extension Int: VectorArithmetic {
    public mutating func scale(by rhs: Double) {
        self = Int(Double(self) * rhs )
    }
    
    public var magnitudeSquared: Double {
        Double(self * self)
    }
    
    
}
