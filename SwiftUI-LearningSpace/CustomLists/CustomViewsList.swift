//
//  CustomViewsList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/26/24.
//

import SwiftUI

struct CustomViewsList: View {
    var listOfViewLabels = ["Clock"]//["Wedge", "Clock"]
    var listOfViews = [ShowClock()]//[ShowWedge(), ShowClock()]
    var body: some View {
        NavigationStack
        {
            List
            {
                ForEach(0..<listOfViewLabels.count, id: \.self) { index in
                    NavigationLink(listOfViewLabels[index])
                    {
                        listOfViews[index]
                    }
                }
            }
        }
    }
}

#Preview {
    CustomViewsList()
}
