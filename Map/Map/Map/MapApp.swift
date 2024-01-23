//
//  MapApp.swift
//  Map
//
//  Created by LinLin on 2024-01-20.
//

import SwiftUI
import SwiftData

@main
struct MapApp: App {
    @StateObject private var vm = LocationsViewModel()

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
            LocationsView()
                .environmentObject(vm)
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
