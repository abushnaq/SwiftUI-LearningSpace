//
//  CustomAnimationList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import SwiftUI

struct CustomAnimationList: View {
    var listOfAnimations = ["Circle path on spin", "Circle progress bar"]
    var listOfViews : [Screens] = [.spinWithDragGesture, .showProgress]
    var body: some View {
        NavigationStack
        {
            List
            {
                ForEach(0...listOfAnimations.count-1, id: \.self) { index in
                    NavigationLink(listOfAnimations[index])
                    {
                        navigate(to: listOfViews[index])
                    }
                }
            }
        }
    }    
}

#Preview {
    CustomAnimationList()
}
