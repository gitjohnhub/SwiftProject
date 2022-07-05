//
//  AddFinance.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/2.
//

import SwiftUI

struct AddFinance: View {
    @State var categorySelectedIndex = 0
    @State var item:String = ""
    @State var priceString:String = "15.0"
    @State var buydate:Date = Date()
    @State var category:Category = .digital
    let onComplete:(_ item:String,_ price: Double,_ buydate:Date,_ category:Category) -> Void
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Item")) {
                        HStack {
                            Text("Item ")
                                .padding(.horizontal)
                                .background(Color.orange)
                                .cornerRadius(20)
                            TextField("item name ",text: $item)
                        }
                        HStack {
                            Text("Price ")
                                .padding(.horizontal)
                                .background(Color.orange)
                                .cornerRadius(20)
                            TextField("Price :",text: $priceString)

                        }
                        DatePicker(selection: $buydate,displayedComponents: .date) {
                            Text("Buy date")
                        }
                        Picker("Category", selection: $category) {
                            ForEach(Category.allCases, id: \.self) { value in
                                                Text(value.localizedName)
                                                    .tag(value)
                                            }
                        }
                    }
                }
               Button(action: addFinanceAction) {
                   Text("Add finance")
                       .foregroundColor(Color.white)
               }
               .padding(.vertical)
               .frame(maxWidth:.infinity)
               .background(Color.orange,in:RoundedRectangle(cornerRadius: 10))
               
            } .navigationBarTitle(Text("Add Finance"),displayMode: .inline)
        }
    }
    func addFinanceAction(){
        onComplete(
            item,Double(priceString)!,buydate,category
        )
    }
}
//
//struct AddFinance_Previews: PreviewProvider {
//    static var previews: some View {
//        AddFinance(){finance in
//
//        }
//    }
//}
