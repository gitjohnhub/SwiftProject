//
//  NotesMacOSApp.swift
//  Shared
//
//  Created by Elon on 2022/7/4.
//

import SwiftUI

@main
struct NotesMacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // Hiding Title bar
        #if os(macOS)
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
