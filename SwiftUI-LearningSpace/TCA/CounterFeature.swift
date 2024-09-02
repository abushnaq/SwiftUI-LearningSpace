//
//  CounterFeature.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/27/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct CounterFeature
{
    @ObservableState
    struct State : Equatable{
        var count = 0
        var fact: String?
        var isLoading = false
        var isTimerRunning = false
    }
      
    enum Action {
        case decrementButtonTapped
        case factButtonTapped
        case factResponse(String)
        case incrementButtonTapped
        case toggleTimerButtonTapped
        case timerTick
    }
    @Dependency(\.continuousClock) var clock
    @Dependency(\.numberFact) var numberFact
    
    enum CancelID { case timer }
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .timerTick:
                    state.count += 1
                    state.fact = nil
                    return .none
            case .decrementButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                return .run { [count = state.count] send in
                    try await send(.factResponse(self.numberFact.fetch(count)))
                }
            case let .factResponse(fact):
                    state.fact = fact
                    state.isLoading = false
                    return .none
            case .incrementButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
            case .toggleTimerButtonTapped:
                    state.isTimerRunning.toggle()
                    if state.isTimerRunning {
                        return .run { send in
                                    for await _ in self.clock.timer(interval: .seconds(1)) {
                                      await send(.timerTick)
                                    }
                                  }
                      .cancellable(id: CancelID.timer)
                    } else {
                      return .cancel(id: CancelID.timer)
                    }
            }
            
        }
    }
}
