//
//  ShowClock.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/6/24.
//

import SwiftUI

struct ShowClock: View {
//    @State var minuteDegree = 0.0
    @State var degree = 0.0
//    {
//        didSet
//        {
//            minuteDegree += 30.0
//        }
//    }
    var body: some View {
        VStack
        {
            ZStack
            {
                Circle()
                    .stroke(.blue, lineWidth: 10.0)
                    .frame(width: 250, height: 250)
//                RoundedRectangle(cornerSize: CGSize(width: 2, height: 2), style: .circular)
//                    .fill(.green)
//                    .frame(width: 110, height: 10)
//                    .offset(x: 27.0, y: 0.0)
//                    .rotationEffect(Angle(degrees: minuteDegree), anchor: .leading)
                
                RoundedRectangle(cornerSize: CGSize(width: 2, height: 2), style: .circular)
                    .fill(.red)
                    .frame(width: 110, height: 10)
                    .offset(x: 27.0, y: 0.0)
                    .rotationEffect(Angle(degrees: degree))
                    .onAppear
                    {
    let baseAnimation = Animation.linear(duration: 60.0)
                        
    let repeated = baseAnimation.repeatForever(autoreverses: false)

        withAnimation(repeated) {
                                            degree = 360.0
        } completion: {
            print("completed!")
        }
                    }
            }
        }
    }
}

#Preview {
    ShowClock()
}
