//
//  AppFeature.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/29/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture


struct AppView: View {
    // let store1: StoreOf<CounterFeature>
    // let store2: StoreOf<CounterFeature>
    let store: StoreOf<AppFeature>
      var body: some View {
        TabView {
            TCADemo(store: store.scope(state: \.tab1, action: \.tab1))
            .tabItem {
              Text("Counter 1")
            }
          
            TCADemo(store: store.scope(state: \.tab2, action: \.tab2))
            .tabItem {
              Text("Counter 2")
            }
        }
      }
    }

#Preview {
  AppView(
    store: Store(initialState: AppFeature.State()) {
      AppFeature()
    }
  )
}

@Reducer
struct AppFeature {
struct State: Equatable {
    var tab1 = CounterFeature.State()
    var tab2 = CounterFeature.State()
  }
  enum Action {
    case tab1(CounterFeature.Action)
    case tab2(CounterFeature.Action)
  }
    
    var body: some ReducerOf<Self> {
       Scope(state: \.tab1, action: \.tab1) {
         CounterFeature()
       }
       Scope(state: \.tab2, action: \.tab2) {
         CounterFeature()
       }
       Reduce { state, action in
         // Core logic of the app feature
         return .none
       }
     }
}
