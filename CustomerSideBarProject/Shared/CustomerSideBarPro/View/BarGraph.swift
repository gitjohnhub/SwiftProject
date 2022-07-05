//
//  BarGraph.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/13.
//

import SwiftUI

struct BarGraph: View {
    var spends:[Analystics]
    var body: some View {
        VStack(spacing: 20.0) {
            HStack {
                Text("Icons downloaded")
                    .fontWeight(.bold)
                Spacer()

            }
        }
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        BarGraph(spends: analysticsData)
    }
}
