//
//  FinanceRowView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/6.
//

import SwiftUI

struct FinanceRow: View {
      var finance: Finance
      static let releaseFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
      }()

      var body: some View {
        VStack(alignment: .leading) {
          finance.item.map(Text.init)
            .font(.title)
          HStack {
              Text("\(finance.category.rawValue)")
                  .font(.caption)
            Spacer()
            finance.buydate.map { Text(Self.releaseFormatter.string(from: $0)) }
              .font(.caption)
          }
        }
      }
}

//struct FinanceRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinanceRowView()
//    }
//}
