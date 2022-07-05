//
//  CardView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI

struct CardView: View {
    var finance:Finance
    var body: some View {
        VStack {
            Image(systemName: "questionmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .center)
            VStack(alignment: .leading) {
                Text(finance.item ?? "default item")
                    .font(.title)
                .fontWeight(.bold)
                HStack(alignment: .center){
                    Image(systemName: "creditcard")
                        .foregroundColor(.yellow)
                    Text("\(finance.source ?? "default source")")
                }
                .font(.title2)
                HStack {
                    Text(doubleToString(num:finance.price))
                        .font(.body)
                        .padding(.horizontal,10)
                        .padding(.vertical,10)
                        .background(Color.orange)
                        .cornerRadius(10)
                    Spacer()
                    Text(Self.dateFormatter.string(from: finance.buydate ?? Date()))
//                    Button(action: {}) {
//                        Image(systemName: "plus")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color("Primary"))
//                            .cornerRadius(50)
//                    }
                }
            }
            .padding()
        }
        .frame(width: 200,height: 300)
        .background(Color.white)
        .cornerRadius(50)
        .shadow(color: Color.black.opacity(0.02), radius: 16, x: 16, y: 16)
    }
    func doubleToString(num: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        formatter.numberStyle = .decimal
        
        return formatter.string(from: num as NSNumber) ?? "n/a"
    }
    
    static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateStyle = .long
      return formatter
    }()
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(finance: FinanceBackUp.sampleFinances[0])
//    }
//}
