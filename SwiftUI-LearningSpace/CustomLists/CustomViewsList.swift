//
//  CustomViewsList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/26/24.
//

import SwiftUI

enum Screens {
    case showWedge
    case showClock
}

struct CustomViewsList: View {
    var listOfViewLabels = ["Wedge", "Clock"]
    var listOfViews : [Screens] = [.showWedge, .showClock]
    var body: some View {
        NavigationStack
        {
            List
            {
                ForEach(0..<listOfViewLabels.count, id: \.self) { index in
                    NavigationLink(listOfViewLabels[index])
                    {
                        navigate(to: listOfViews[index])
                        
                    }
                }
            }
        }
    }
    @ViewBuilder
        func navigate(to screen: Screens) -> some View {
            switch screen {
            case .showWedge:
                ShowWedge()
            case .showClock:
                ShowClock()
            }
        }
    
}

#Preview {
    CustomViewsList()
}
