//
//  CustomViewsList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/26/24.
//

import SwiftUI



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
}

#Preview {
    CustomViewsList()
}
