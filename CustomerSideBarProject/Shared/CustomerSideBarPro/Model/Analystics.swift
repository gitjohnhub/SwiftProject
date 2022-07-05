//
//  Analystics.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/13.
//

import Foundation

struct Analystics:Identifiable{
    var id = UUID().uuidString
    var spend: CGFloat
    var weekDay:String
}


var analysticsData:[Analystics] = [

    Analystics(spend: 500, weekDay: "Mon"),
    Analystics(spend: 240, weekDay: "Tue"),
    Analystics(spend: 211, weekDay: "Wed"),
    Analystics(spend: 500, weekDay: "Fri"),
    Analystics(spend: 222, weekDay: "Sun"),
    Analystics(spend: 211, weekDay: "Sat"),
    Analystics(spend: 240, weekDay: "Sun")
]
