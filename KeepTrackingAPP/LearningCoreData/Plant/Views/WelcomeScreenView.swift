//
//  WelcomeScreenView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI


struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .overlay(LinearGradient(colors: [Color.black.opacity(0.45),Color.black.opacity(0.95)], startPoint: .topLeading, endPoint: .bottomLeading))
                    .ignoresSafeArea()
                
                    VStack(alignment: .leading) {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        Spacer()
                        Text("Track")
                            .font(.title)
                            .fontWeight(.light)
                        Text("your life")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Text("Decorate your house to make \nit look greener")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .opacity(0.7)
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: SecondWelcomeScreenView()) {
                                NextBtn()
                            }
              
                        }
                    }
                    .foregroundColor(.white)
                .padding()
            }
        }
    }
}
struct NextBtn: View {
    var body: some View {
        HStack {
            Text("Next")
                .font(.system(size:20))
                .fontWeight(.semibold)
            Image(systemName: "chevron.forward")
        }
        .foregroundColor(.black)
        .padding()
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(50)
    }
}
struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}
