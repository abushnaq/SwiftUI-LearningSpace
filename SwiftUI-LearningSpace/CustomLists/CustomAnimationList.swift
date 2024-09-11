//
//  CustomAnimationList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import SwiftUI

struct CustomAnimationList: View {
    var listOfAnimations = ["Circle progress bar"]//["Circle path on spin", "Circle progress bar"]
    var listOfViews = [ShowProgress()]//[SpinWithDragGesture(), CustomProgressBar()]
    var body: some View {
        NavigationStack
        {
            List
            {
                ForEach(0...listOfAnimations.count-1, id: \.self) { index in
                    NavigationLink(listOfAnimations[index])
                    {
                        listOfViews[index]
                    }
                }
            }
        }
    }
}

#Preview {
    CustomAnimationList()
}
