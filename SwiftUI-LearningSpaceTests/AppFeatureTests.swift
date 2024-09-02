//
//  AppFeatureTests.swift
//  SwiftUI-LearningSpaceTests
//
//  Created by Ahmad Remote on 8/29/24.
//

import ComposableArchitecture
import XCTest


@testable import SwiftUI_LearningSpace
@MainActor
final class AppFeatureTests: XCTestCase {
  func testIncrementInFirstTab() async {
      let store = await TestStore(initialState: AppFeature.State()) {
            AppFeature()
          }
      
      await store.send(\.tab1.incrementButtonTapped) {
            $0.tab1.count = 1
          }
  }
}
