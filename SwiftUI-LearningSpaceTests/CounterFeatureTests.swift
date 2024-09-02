////
////  CounterFeatureTests.swift
////  SwiftUI-LearningSpaceTests
////
////  Created by Ahmad Remote on 8/27/24.
////
//
//import ComposableArchitecture
//import XCTest
//
//
//@testable import SwiftUI_LearningSpace
//struct NumberFactClient {
//  var fetch: (Int) async throws -> String
//}
//
//extension NumberFactClient: DependencyKey {
//  static let liveValue = Self(
//    fetch: { number in
//      let (data, _) = try await URLSession.shared
//        .data(from: URL(string: "http://numbersapi.com/\(number)")!)
//      return String(decoding: data, as: UTF8.self)
//    }
//  )
//}
//
//extension DependencyValues {
//  var numberFact: NumberFactClient {
//    get { self[NumberFactClient.self] }
//    set { self[NumberFactClient.self] = newValue }
//  }
//}
//
//
//
//
//@MainActor
//final class CounterFeatureTests: XCTestCase {
//    func testNumberFact() async {
//        let store = await TestStore(initialState: CounterFeature.State()) {
//              CounterFeature()
//            }
//        
//        await store.send(.factButtonTapped) {
//              $0.isLoading = true
//            }
//        await store.receive(\.factResponse) {
//              $0.isLoading = false
//              $0.fact = "0 is a good number."
//            }
//        
//      }
//    
//    func testTimer() async {
//        let clock = TestClock()
//        let store = await TestStore(initialState: CounterFeature.State()) {
//          CounterFeature()
//        } withDependencies: {
//            $0.continuousClock = clock
//          }
//        await store.send(.toggleTimerButtonTapped) {
//              $0.isTimerRunning = true
//            }
//        await clock.advance(by: .seconds(1))
//            await store.receive(\.timerTick) {
//              $0.count = 1
//            }
//        await store.send(.toggleTimerButtonTapped) {
//              $0.isTimerRunning = false
//            }
//      }
//    
//    func testCounter() async {
//      let store = await TestStore(initialState: CounterFeature.State()) {
//            CounterFeature()
//          }
//      await store.send(.incrementButtonTapped) {
//            $0.count = 1
//          }
//          await store.send(.decrementButtonTapped) {
//            $0.count = 0
//          }
//  }
//}
