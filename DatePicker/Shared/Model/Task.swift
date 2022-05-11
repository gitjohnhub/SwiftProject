//
//  Task.swift
//  DatePickerProject (iOS)
//
//  Created by Yi on 2021/12/5.
//

import SwiftUI

struct Task:Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}


struct TaskMetaData:Identifiable {
    var id = UUID().uuidString
    var task:[Task]
    var taskDate:Date
}


func getSampleDate(offset: Int)->Date {
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}


var tasks:[TaskMetaData] = [
    TaskMetaData(task: [Task(title: "Talk to iJustine"),Task(title: "iPhone 13 great design change")], taskDate: getSampleDate(offset: 1)),
    TaskMetaData(task: [Task(title: "Talk to Jenna Ezarik"),Task(title: "iPhone change")], taskDate: getSampleDate(offset: -2)),
    TaskMetaData(task: [Task(title: "Talk to iJustine"),Task(title: "iPhone 13 great design change")], taskDate: getSampleDate(offset: 5)),
    TaskMetaData(task: [Task(title: "Talk to iJustine"),Task(title: "iPhone 13 great design change")], taskDate: getSampleDate(offset: -8))
]
