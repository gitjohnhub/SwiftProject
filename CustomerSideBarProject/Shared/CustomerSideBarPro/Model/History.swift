//
//  History.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/13.
//

import SwiftUI

struct History:Identifiable{
    var id = UUID().uuidString
    var image:String
    var description:String
    var time:String
    var amount:String
}

var histories:[History] = [
    History(image: "person", description: "Loan", time: "10:30 pm", amount: "$320"),
    History(image: "person", description: "MacBook", time: "10:30 pm", amount: "$320"),
    History(image: "person", description: "Loan", time: "10:30 pm", amount: "$320"),
    History(image: "person", description: "Loan", time: "10:30 pm", amount: "$320")
]
