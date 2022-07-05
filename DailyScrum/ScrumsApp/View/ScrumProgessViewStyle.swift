//
//  ScrumProgessViewStyle.swift
//  ScrumsApp
//
//  Created by Elon on 2022/4/21.
//

import SwiftUI

struct ScrumProgessViewStyle: ProgressViewStyle {
    var theme:Theme
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height:20.0)
            if #available(iOS 15.0, *) {
                ProgressView(configuration)
                    .tint(theme.mainColor)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            } else {
                ProgressView(configuration)
                    .frame(height: 12.0)
                    .padding(.horizontal)
            }
        }
    }
}

struct ScrumProgessViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.4)
            .progressViewStyle(ScrumProgessViewStyle(theme: .buttercup))
            .previewLayout(.sizeThatFits)
    }
}
