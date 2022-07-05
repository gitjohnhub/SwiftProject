//
//  HomeScreen.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI

struct FinanceScreenView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var filter:InOutComing = .all
    @State var isPresent = false
    @FetchRequest(entity: Finance.entity(),
                  sortDescriptors: [
                    NSSortDescriptor(keyPath: \Finance.item, ascending: true)],
                  predicate: nil)var finances:FetchedResults<Finance>
    var body: some View {
        ZStack {
            Color("bg_color")
                .ignoresSafeArea()
            VStack {
                HeaderView(finances: finances, filter: $filter, isPresent: $isPresent)
                RecommandView(finances: finances)
                Spacer()
            }.padding()
           
        }
        .sheet(isPresented: $isPresent, content: {
            AddFinance() { item,price,buydate,category in
                addFinance(item: item, price: price, buyDate: buydate, category: category)
                self.isPresent.toggle()
            }
        })
    }
    func addFinance(item:String,price:Double,buyDate:Date,category:Category){
        let newFinance = Finance(context: managedObjectContext)
        print(price,item)
        newFinance.fid = UUID()
        newFinance.item = item
        newFinance.buydate = buyDate
        newFinance.category = category
        newFinance.price = price
        saveContext()
    }
    
//    func deteFiannce(at offsets:IndexSet) {
//        offsets.forEach { index in
//            let finance = self.finances[index]
//            finances.remove(at: index)
//            self.managedObjectContext.delete(finance)
//            saveContext()
//        }
//    }
    
    func saveContext(){
        do {
            try managedObjectContext.save()
        }catch {
            print("error:\(error)")
        }
    }
}

//
//struct HomeScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        FinanceScreenView(finances: FinanceBackUp.sampleFinances)
//    }
//}

