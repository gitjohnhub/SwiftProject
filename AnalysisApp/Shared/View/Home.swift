//
//  Home.swift
//  AnalysisApp (iOS)
//
//  Created by Elon on 2022/7/9.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Button{
                    
                }label: {
                    Image(systemName: "slider.vertical.3")
                        .font(.title2)
                }
                Spacer()
                Button{
                    
                }label:{
                    Image(systemName: "square.and.arrow.down.on.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:45, height: 45)
                        .clipShape(Circle())
                }
            }
            .padding()
            .foregroundColor(.black)
            
            VStack(spacing:10){
                Text("Total balance")
                    .fontWeight(.bold)
                
                Text(" $ 51 200")
                    .font(.system(size: 38, weight: .bold))
            }
            .padding(.top,20)
            Button{
                
            }label: {
                HStack(spacing: 5){
                    Text("Income")
                    Image(systemName: "chevron.down")
                }
                .font(.caption.bold())
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(.white,in: Capsule())
                .foregroundColor(.black)
                .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
                .shadow(color: .black.opacity(0.03), radius: 5, x: -5, y: -5)

            }
            // graphic view
            LineGraph(data: samplePlot)
                .frame(height:250)

        }
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
