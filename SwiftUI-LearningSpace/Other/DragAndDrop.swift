//
//  DragAndDrop.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/25/24.
//

import SwiftUI

struct DragAndDrop: View {
    @State var dropImage : Image = Image(systemName: "drop.fill")
    
    var body: some View {
        VStack
        {
            Image("StreetImage")
                .frame(maxWidth: 50.0, maxHeight: 50.0)
                .clipped()
                .draggable(Image("StreetImage"))
           
                Text("Hello, World!")
                dropImage
                    .frame(maxWidth: 100.0, maxHeight: 100.0)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                                .background(.green)
                                .foregroundStyle(.white)
                                .dropDestination(for: Image.self) { items, location in
                                    dropImage = items.first ?? Image(systemName: "photo")
                                    return true
                                }
                
                
            
            
            
//                .draggable("Hello")
//            {
//                ZStack {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .frame(width: 300, height: 300)
//                                    .foregroundStyle(.yellow.gradient)
//                                Text("Drop me!")
//                                    .font(.title)
//                                    .foregroundStyle(.red)
//                            }
//            }
            
        }
        
    }
}

#Preview {
    DragAndDrop()
}
