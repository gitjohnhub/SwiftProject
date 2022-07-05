//
//  Recent.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/13.
//

import Foundation

struct Recent:Identifiable{
    var id = UUID().uuidString
    var title:String
    var price:String
    var image:String
}

var recents:[Recent] = [
    Recent(title: "Transfer via \nCard Number", price: "$1200", image: "creditcard"),
    Recent(title: "Transfer Other \nBanks", price: "$120", image: "arrow.left.arrow.right"),
    Recent(title: "Transfer Same \nBank", price: "$150", image: "building.columns"),
    Recent(title: "Transfer via \nPaypal", price: "$800", image: "building.2.fill"),


]
