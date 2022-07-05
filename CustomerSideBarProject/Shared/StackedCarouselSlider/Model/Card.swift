//
//  Card.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/14.
//

import SwiftUI

struct Card:Identifiable{
    var id = UUID().uuidString
    var cardColor:Color
    var date:String = ""
    var title:String
}
