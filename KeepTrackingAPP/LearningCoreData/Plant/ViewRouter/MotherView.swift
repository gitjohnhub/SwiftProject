//
//  MotherVIew.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI

struct MotherView: View {
    @EnvironmentObject var viewRouter:ViewRouter
    var body: some View {
        VStack {
            switch viewRouter.currentPage {
                case "welcomeScreenView":
                    WelcomeScreenView()
                case "homeScreenView":
                    TabMainView()
                default:
                    WelcomeScreenView()
            }
                
        }
    }
}

struct MotherVIew_Previews: PreviewProvider {
    static var previews: some View {
        MotherView()
            .environmentObject(ViewRouter())
    }
}
