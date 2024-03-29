//
//  ChementisApp.swift
//  Chementis
//
//  Created by hunter downey on 4/7/23.
//

import SwiftUI

@main
struct ChementisApp: App {
    @StateObject var placementSettings = PlacementSettings()
    @StateObject var sessionSettings = SessionSettings()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(placementSettings)
                .environmentObject(sessionSettings)
        }
    }
}
