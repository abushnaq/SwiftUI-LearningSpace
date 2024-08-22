//
//  SwiftUI_LearningSpaceApp.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 8/22/24.
//

import SwiftUI
import SwiftData

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

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
