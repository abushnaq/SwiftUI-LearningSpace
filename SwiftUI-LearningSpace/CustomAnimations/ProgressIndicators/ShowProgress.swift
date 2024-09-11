//
//  ShowProgress.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/10/24.
//

import SwiftUI

@Observable class Progress
{
    var value : Double = 0.0
}

struct ShowProgress: View {
    func stopTimer() {
        self.timer.upstream.connect().cancel()
    }
    
    func startTimer() {
        self.progress.value = 0.0
        self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    }
    @State private var progress : Progress = Progress()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack
        {
            Button("Make progress!") {
                startTimer()
            }
            CircleProgressBar(progress)
            CustomProgressBar(progress)
                .frame(width: 200, height: 20)
                .onReceive(timer) { _ in
                    let increment = Double.random(in: 0.05...0.3)
                    var nextValue = progress.value + increment
                    if nextValue > 1.0
                    {
                        nextValue = 1.0
                    }
                    progress.value = nextValue
                    
                    if progress.value >= 1.0
                    {
                        self.stopTimer()
                    }
                }
        }
    }
}

#Preview {
    ShowProgress()
}
