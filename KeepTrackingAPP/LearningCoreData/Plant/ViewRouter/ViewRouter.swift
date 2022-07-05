//
//  ViewRouter.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import Foundation

class ViewRouter:ObservableObject {
    @Published var currentPage: String
    init(){
        if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
            UserDefaults.standard.set(true,forKey: "didLaunchBefore")
            currentPage = "welcomeScreenView"
        } else {
            currentPage = "homeScreenView"
        }
    }
}
