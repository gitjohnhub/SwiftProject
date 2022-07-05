//
//  Note.swift
//  NotesMacOS (iOS)
//
//  Created by Elon on 2022/7/4.
//

import SwiftUI

struct Note:Identifiable{
    var id = UUID().uuidString
    var note:String
    var date: Date
    var cardColor:Color
}

func getSampleDate(offset:Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset,to: Date())
    return date ?? Date()
}


var notes:[Note] = [
    Note(note: "The beginning of screenless design UI jobs to be taken", date: getSampleDate(offset: 1), cardColor: Color.white),
    Note(note: "13 Things You should give up if you want to be a successful UX Designer", date: getSampleDate(offset: -10), cardColor: Color.purple),
    Note(note: "The beginning of screenless design UI jobs to be taken", date: getSampleDate(offset: 1), cardColor: Color.white),
    Note(note: "13 Things You should give up if you want to be a successful UX Designer", date: getSampleDate(offset: -10), cardColor: Color.purple)
]
