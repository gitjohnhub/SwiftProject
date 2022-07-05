//
//  CustomerSIdeBarProjectApp.swift
//  Shared
//
//  Created by Elon on 2021/12/12.
//

import SwiftUI

@main
struct CustomerSIdeBarProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

//remove texfield ring
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{return .none}
        set{

        }
    }
}
