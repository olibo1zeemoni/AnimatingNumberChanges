//
//  ScannerView.swift
//  AnimatingNumberChanges
//
//  Created by Olibo moni on 23/08/2023.
//

import SwiftUI

struct ScannerView: View {
    var body: some View {
        VStack {
            half
                .foregroundColor(.red)
                //.background(Color.gray)
            
            half
                .rotationEffect(Angle(degrees: 180))
        }
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}



struct QRRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path{ path in
            path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY * 0.5))
            path.addArc(center: CGPoint(x: rect.minX + 25, y: rect.minY + 25), radius: 25, startAngle: Angle(degrees: -180), endAngle: Angle(degrees: -90), clockwise: false)
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
    }
    
    
}


extension ScannerView {
    var half: some View {
        HStack {
            QRRectangle()
                .stroke(style: StrokeStyle(lineWidth: 3))
            .frame(width: 70, height: 70)
            .padding()
            
            QRRectangle()
                .stroke(style: StrokeStyle(lineWidth: 3))
            .frame(width: 70, height: 70)
            .rotationEffect(Angle(degrees: 90))
            .padding()
            
        }
    }
}
