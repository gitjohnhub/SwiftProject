//
//  CardHomeView.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/14.
//

import SwiftUI

struct CardHomeView: View {
    
    @State var cards:[Card] = [
        Card(cardColor: Color.blue,date: "Monday 8th November", title: "Neurobics for your \nmind"),
        Card(cardColor: Color.purple,date: "Monday 8th November", title: "Neurobics for your \nmind"),
        Card(cardColor: Color.green,date: "Monday 8th November", title: "Neurobics for your \nmind"),
        Card(cardColor: Color.pink,date: "Monday 8th November", title: "Neurobics for your \nmind")
    ]
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("9TH OF NOV")
                    .font(.title.bold())
                HStack{
                    Label("New York,USA", systemImage: "location.circle")
    //                Image(systemName: "location.circle")
                    Spacer()
                    Text("Upload 1:30 PM")
                        .foregroundColor(.gray)
                }
            }
            GeometryReader{proxy in
                let size = proxy.size
                InfiniteStackedCards(cards: $cards)
                    .frame(height: size.height / 1.6)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
            }
        }
    }
}

struct CardHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CardHomeView()
    }
}

struct InfiniteStackedCards:View {
    @Binding var cards:[Card]
    var body: some View{
        ZStack{
            
        }
    }
}
