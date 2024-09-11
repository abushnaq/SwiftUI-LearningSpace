//
//  CustomProgressBar.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/10/24.
//

import SwiftUI



struct CustomProgressBar: View {
    var width = 150.0
    @State private var progress : Progress
    init(_ progress: Progress) {
        self.progress = progress
    }
    var body: some View {
        ZStack(alignment: .leading)
        {
            RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                .fill(.blue)
                .frame(width: width, height: 20.0, alignment: .center)
            RoundedRectangle(cornerSize: CGSize(width: 5.0, height: 5.0))
                .fill(.green)
                .frame(width: width * progress.value, height: 20.0, alignment: .center)
          
        }
    }
}

#Preview {
    CustomProgressBar(Progress())
}
