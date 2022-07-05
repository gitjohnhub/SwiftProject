//
//  TabMainView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/6.
//

import SwiftUI

struct TabMainView: View {
    let context = Persistances().persistentContainer.viewContext
    @State var currentTab = ""
    var body: some View {
        NavigationView {
            TabView(selection: $currentTab) {
                    FinanceScreenView()
                        .environment(\.managedObjectContext, context)
                        .tabItem{
                            Image(systemName: "infinity.circle.fill")
                        Text("Finance")

                }
                Text("Movie")
                    .tabItem{
                        Image(systemName: "film.fill")
                        Text("Movies")
                    }
            }
            .navigationBarTitle(Text("Track"))
        }
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
