//
//  LabeledWedge.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/26/24.
//

import SwiftUI

struct Wedge : Shape
{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let origin = rect.origin
        let size = rect.size
//        path.move(to: CGPoint(x: size.width / 2.0, y: 0.0))
//        path.addLine(to: CGPoint(x: 0.0, y: size.height))
        path.move(to: CGPoint(x: 0.0, y: size.height))
        
        path.move(to: CGPoint(x: size.width / 2.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: size.height))
//        
        path.addCurve(to: CGPoint(x: size.width , y: size.height), control1: CGPoint(x: size.width / 4.0, y: size.height + size.height / 4.0), control2: CGPoint(x: 3.0 * size.width / 4.0, y: size.height + size.height / 4.0))
        path.addLine(to: CGPoint(x: size.width / 2.0, y: 0.0))
        
        return path
    }
    
    
}



struct LabeledWedge: View {
    var body: some View {
        ZStack
        {
            Wedge().stroke(.blue, lineWidth: 5.0)
                .frame(width: 100, height: 100)
            Text("Ahmad").rotationEffect(Angle(degrees: -90.0))
        }
    }
}

#Preview {
    LabeledWedge()
}
