//
//  FinanceEx.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/6.
//

import SwiftUI
extension Finance {
    var category:Category {
        get {
            return Category(rawValue: self.categoryValue!)!
        }
        set {
            self.categoryValue = newValue.rawValue
        }
    }
}
enum Category:String,CaseIterable {
    case digital = "数码",life = "生活用品"
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }

}

enum InOutComing:String {
case incoming = "Incoming",outcoming = "OutComing",all = "All"
}
