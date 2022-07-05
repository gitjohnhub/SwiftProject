//
//  LearningCoreDataApp.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/2.
//

import SwiftUI

@main
struct LearningCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            MotherView()
                .environmentObject(ViewRouter())

//                .environment(\.managedObjectContext, context)
        }
    }
}
