//
//  ContentView.swift
//  Shared
//
//  Created by Elon on 2022/7/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
            .buttonStyle(BorderedButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
