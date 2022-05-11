//
//  ContentView.swift
//  Shared
//
//  Created by Elon on 2022/5/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarTitle("Task Manager")
                .navigationBarTitleDisplayMode(.inline)
        }
    }

   
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
