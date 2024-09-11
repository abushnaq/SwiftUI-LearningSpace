//
//  CircleProgressBar.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/10/24.
//

import SwiftUI

struct Arc : Shape
{
    private var value : Double
    init(value: Double) {
        self.value = value
    }
    var animatableData: Double {
        get { return value }
        set {
            value = newValue
        }
    }
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let end = value * 360
        
        path.addArc(center: CGPoint(x: rect.size.width / 2, y: rect.size.height / 2), radius: rect.size.width / 2, startAngle: Angle(degrees: 270.0), endAngle: Angle(degrees: 270.0 + end), clockwise: false)
        return path
    }
}
struct CircleProgressBar: View {
    @State private var progress : Progress
    init(_ progress: Progress) {
        self.progress = progress
    }
    var body: some View {
        ZStack(alignment: .leading)
        {
            Circle()
                .stroke(.blue, lineWidth: 20.0)
                .frame(width: 100.0, height: 100.0)
            Arc(value: self.progress.value)
                .stroke(.purple, lineWidth: 20.0)
                .frame(width: 100.0, height: 100.0)
        }
    }
}

#Preview {
    CircleProgressBar(Progress())
}
