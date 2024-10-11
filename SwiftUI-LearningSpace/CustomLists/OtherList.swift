//
//  OtherList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct OtherList: View {
    var listOfViewLabels = ["Contacts TCA Demo", "Cut Image", "Drag and Drop", "Play Video", "Calendar Integration"]
    var listOfViews : [Screens] = [.tcaDemo, .cutImage, .dragDrop, .playVideo, .calendar]

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
    OtherList()
}
