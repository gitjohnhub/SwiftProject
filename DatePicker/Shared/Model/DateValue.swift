//
//  DateValue.swift
//  DatePickerProject (iOS)
//
//  Created by Yi on 2021/12/5.
//

import Foundation
struct DateValue:Identifiable {
    var id = UUID().uuidString
    var day:Int
    var date: Date
}
