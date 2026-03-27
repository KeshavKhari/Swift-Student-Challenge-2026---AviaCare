//
//  BirdAidApp.swift
//  BirdAid
//
//  Created by Keshav Khari on 02/02/26.
//

import SwiftUI
import SwiftData

@main
struct AviaCare: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Incident.self, IncidentUpdate.self])
    }
}
