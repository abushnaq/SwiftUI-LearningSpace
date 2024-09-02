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
    
    func convertCIImageToCGImage(inputImage: CIImage) -> CGImage? {
        let context = CIContext(options: nil)
        if let cgImage = context.createCGImage(inputImage, from: inputImage.extent) {
            return cgImage
        }
        return nil
    }
    
    func image() -> Image {
        if let uiImage = UIImage(named: "Test")
        {
            if var ciimage = CIImage(image: uiImage)
            {
                var ciimage2 = ciimage.clamped(to: CGRect(x: 50, y: 50, width: 768, height: 680))

                ciimage2 = ciimage.cropped(to: CGRect(x: 0, y: 0, width: 768, height: 680))
                let newUIImage = UIImage(ciImage: ciimage2)
             //   return Image("Test")
                let cgImage = convertCIImageToCGImage(inputImage: ciimage2)!
                let img = UIImage(cgImage: cgImage)//UIImage(ciImage: ciimage)
                return Image(uiImage: img)//newUIImage)

                return Image(uiImage: newUIImage)//uiImage)//newUIImage)
            }
        }
        return Image("Test")
    }
    
    var body: some View {
        VStack
        {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            image()
                .foregroundColor(Color.red)
                .padding(.horizontal)
                .fixedSize()
                .frame(width: 400.0, height: 300.0)
                .clipped()
                .frame(minWidth: 100, maxWidth: 100, minHeight: 100, maxHeight: 100)

                
            Text("Hello, World2!")
        }
    }
}

#Preview {
    CutImage()
}
