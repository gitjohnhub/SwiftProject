//
//  ScrumsAppApp.swift
//  ScrumsApp
//
//  Created by Elon on 2022/4/21.
//

import SwiftUI

@main
struct ScrumsApp: App {
    @State private var scrums:[DailyScrum] = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
               
        }
    }
}
