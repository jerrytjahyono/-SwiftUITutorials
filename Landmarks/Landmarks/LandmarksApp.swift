//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by jerry tri tjahyono on 19/04/24.
//

import SwiftUI
import SwiftData

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
        
        #if !os(watchOS)
        
        .commands {
            LandmarkCommands()
        }
        #endif
        
        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
        
    }
}
