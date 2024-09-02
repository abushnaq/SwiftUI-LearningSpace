//
//  OtherList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct OtherList: View {
    var listOfViewLabels = ["First TCA Demo"]
    var listOfViews = [TCADemo(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
      }
    )]
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
    OtherList()
}
