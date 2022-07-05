//
//  SecondWelcomeScreenView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI

struct SecondWelcomeScreenView: View {
    @EnvironmentObject var viewRouter:ViewRouter
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Capsule().strokeBorder(lineWidth: 25)
                    .frame(width: 100, height: 200, alignment: .center)
                .foregroundColor(.orange)
                VStack(alignment: .leading) {
                    Text("Keep")
                        .font(.system(size: 100))
                        .fontWeight(.bold)
                    Text("Tracking")
                        .font(.system(size: 50))
                }

            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    viewRouter.currentPage = "homeScreenView"
                }) {
                    Text("Go Tracking")
                        .fontWeight(.bold)
                    Image(systemName: "chevron.forward")
                }

                .foregroundColor(.white)
                .padding()
                .background(Color("Primary"))
                .cornerRadius(20)
            .navigationBarHidden(true)
            }
        }.padding()
    }
}

struct SecondWelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SecondWelcomeScreenView()
            .environmentObject(ViewRouter())
    }
}
