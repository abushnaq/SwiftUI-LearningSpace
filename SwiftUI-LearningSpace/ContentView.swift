//
//  ContentView.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            CustomAnimationList()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Custom Animations")
                }
                .tag(1)
            CustomViewsList()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Custom Views")
                }
                .tag(2)
            OtherList()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Others")
                }
                .tag(3)
            }
    }
}

#Preview {
    ContentView()
}
