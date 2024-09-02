//
//  SwiftUI_LearningSpaceApp.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import SwiftUI
import SwiftData
import ComposableArchitecture
import XCTestDynamicOverlay

@main
struct SwiftUI_LearningSpaceApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    @State var store = Store(initialState: ContactsFeature.State()) {
        ContactsFeature()
            ._printChanges()
      }
    var body: some Scene {
        WindowGroup {
            if !_XCTIsTesting {
                ContactsView(
                    store: self.store
                )
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
