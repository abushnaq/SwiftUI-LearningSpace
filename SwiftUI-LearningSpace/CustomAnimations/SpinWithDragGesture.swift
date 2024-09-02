//
//  SpinWithDragGesture.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import SwiftUI

struct SpinWithDragGesture: View {
    @State var x = 100.0
    @State var y = 100.0
    @State var percent = 0.0
    @State var targetPercent = 0.0
    @State var xGeometry : CGFloat = 100
    @State var yGeometry : CGFloat = 0
    
    var body: some View {        
        ZStack
        {
            Path { path in
                path.addArc(
                    center: CGPoint(x: 200, y: 200),
                    radius: 100,
                    startAngle: .degrees(0),
                    endAngle: .degrees(360),
                    clockwise: true
                )
            }

            Circle()
                .stroke(.blue, lineWidth: 10.0)
                .offset(x: xGeometry, y: yGeometry)
                .rotationEffect(Angle(degrees: 360 * percent))
                .frame(width: 50, height: 50)
                .position(CGPoint(x: 200, y: 200))
                .gesture(DragGesture().onEnded() { gesture in
                    var response = 3.0
                    if gesture.velocity.height > 0 && gesture.velocity.height < 300 {
                        response = 5.0
                        targetPercent = 2.0
                    }
                    else if gesture.velocity.height >= 300 && gesture.velocity.height <= 700
                    {
                        response = 3.0
                        targetPercent = 3.0
                    }
                    else
                    {
                        response = 1.0
                        targetPercent = 5.0
                    }

                    withAnimation(.spring(response: response, dampingFraction: 1.5, blendDuration: 0.0)) {
                        percent = targetPercent
                    }
                })

        }.navigationTitle(Text("Spin circle with drag"))
    }
}

#Preview {
    SpinWithDragGesture()
}
