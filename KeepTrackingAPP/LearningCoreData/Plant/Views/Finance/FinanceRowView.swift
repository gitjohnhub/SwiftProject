//
//  FinanceRowView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/6.
//

import SwiftUI

struct FinanceRowView: View {
    @Binding var filter:InOutComing
    var finances:FetchedResults<Finance>
    var filterFinances:[Finance] {
        switch filter {
        case .incoming:
            return finances.filter { $0.tag == "incoming"}
        case .outcoming:
            return finances.filter { $0.tag == "outcoming"}
        case .all:
            return finances.filter { _ in
                return true }
        }
    }
    var body: some View {
        List {
            ForEach(filterFinances,id: \.fid) {finance in
                FinanceRow(finance: finance)
            }
        }
    }
}

//struct FinanceRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinanceRowView()
//    }
//}
