//
//  RecommandView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI

struct RecommandView: View {
    var finances:FetchedResults<Finance>
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(finances,id:\.fid) {finance in
                    CardView(finance: finance)
                        .padding(.horizontal)
                }
            }
        }
    }
}

//
//struct RecommandView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommandView(finances: FinanceBackUp.sampleFinances)
//    }
//}
