//
//  TCADemo.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/27/24.
//

import SwiftUI
import ComposableArchitecture

struct TCADemo: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
              Text("\(store.count)")
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
              HStack {
                Button("-") {
                  store.send(.decrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                
                Button("+") {
                  store.send(.incrementButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                  Button(store.isTimerRunning ? "Stop timer" : "Start timer") {
                          store.send(.toggleTimerButtonTapped)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                  
                  Button("Fact") {
                          store.send(.factButtonTapped)
                        }
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black.opacity(0.1))
                        .cornerRadius(10)
                  
                  if store.isLoading {
                          ProgressView()
                        } else if let fact = store.fact {
                          Text(fact)
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .padding()
                        }
              }
            }
    }
}

#Preview {
    TCADemo(store: Store(initialState: CounterFeature.State()) {
        CounterFeature()
      }
    )
  }
