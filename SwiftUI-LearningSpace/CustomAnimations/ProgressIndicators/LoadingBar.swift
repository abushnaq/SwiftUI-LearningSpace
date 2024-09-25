//
//  LoadingBar.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/11/24.
//

import SwiftUI

struct LoadingBar: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Capsule()
            .fill(.clear)
            .background(
                LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)
                )
            
            .frame(width: 250, height: 50)

                    
    }
}

#Preview {
    LoadingBar()
}
