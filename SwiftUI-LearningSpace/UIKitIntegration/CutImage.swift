//
//  CutImage.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/2/24.
//

import SwiftUI

struct CutImage: View {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let origin = rect.origin
        let size = rect.size
        path.move(to: CGPoint(x: 0.0, y: size.height))
        
        path.move(to: CGPoint(x: size.width / 2.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: size.height))
//
        path.addCurve(to: CGPoint(x: size.width , y: size.height), control1: CGPoint(x: size.width / 4.0, y: size.height + size.height / 4.0), control2: CGPoint(x: 3.0 * size.width / 4.0, y: size.height + size.height / 4.0))
        path.addLine(to: CGPoint(x: size.width / 2.0, y: 0.0))
        
        return path
    }
    

    
    
    var body: some View {
        VStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            UIImageHolder()
//            HStack
//            {
//                Image("StreetImage")
//                    .padding(.horizontal)
//                    .fixedSize()
//                    .frame(width: 400.0, height: 300.0)
//                    .clipped()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100)
            Text("Hello, World3!")
//            List
//            {
//                ForEach(0..<36) { imageIdx in
//                    image()[imageIdx]
//                        .padding(.horizontal)
//                        .fixedSize()
//                        .frame(width: 50.0, height: 50.0)
//                    //                    .clipped()
//                    //                    .aspectRatio(contentMode: .fit)
//                    //                    .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
//                }
//            }
//                image()
//                    .padding(.horizontal)
//                    .fixedSize()
//                    .frame(width: 200.0, height: 200.0)
//                    .clipped()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(minWidth: 200, maxWidth: 200, minHeight: 200, maxHeight: 200)
//            }
                
            Text("Hello, World2!")
        }
    }
}

#Preview {
    CutImage()
}
