//
//  NumberFactClient.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/28/24.
//

import Foundation
import ComposableArchitecture

struct NumberFactClient {
  var fetch: (Int) async throws -> String
}

extension NumberFactClient: DependencyKey {
  static let liveValue = Self(
    fetch: { number in
      let (data, _) = try await URLSession.shared
        .data(from: URL(string: "http://numbersapi.com/\(number)")!)
      return String(decoding: data, as: UTF8.self)
    }
  )
}

extension NumberFactClient : TestDependencyKey {
    static let previewValue: NumberFactClient = Self(
        fetch: { number in
            return "\(number) is a good number."
        })
    
    static let testValue: NumberFactClient = Self(
        fetch: { number in
            return "\(number) is a good number."
        })        
}


extension DependencyValues {
  var numberFact: NumberFactClient {
    get { self[NumberFactClient.self] }
    set { self[NumberFactClient.self] = newValue }
  }
}
