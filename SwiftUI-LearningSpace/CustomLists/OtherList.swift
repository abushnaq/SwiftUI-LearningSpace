//
//  OtherList.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct OtherList: View {
    var listOfViewLabels = ["Contacts TCA Demo"]
    var listOfViews = [ContactsView(store: Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
      })]
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
