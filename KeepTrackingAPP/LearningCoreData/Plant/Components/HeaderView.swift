//
//  HeaderView.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/4.
//

import SwiftUI

struct HeaderView: View {
    @Namespace var tabTransition
    var finances:FetchedResults<Finance>
    @Binding var filter:InOutComing
    @Binding var isPresent:Bool
    @State var currentTabIndex:Int = 0
    let tabs = ["All","Outcome","Income"]
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Finance")
                        .fontWeight(.semibold)
                        .font(.title)
                    Text("track your personal finance")
                        .fontWeight(.light)
                        .font(.title3)
                }
                Spacer()
                Button(action: {isPresent.toggle()}) {
                    Image(systemName: "plus")
                }
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60, alignment: .center)
                    .cornerRadius(50)
            }
            ScrollView(.horizontal,showsIndicators: false){
                HStack {
                    ForEach(tabs,id:\.self){tab in
                        Button(action: {
                            withAnimation(.spring()) {
                                currentTabIndex = tabs.firstIndex(of: tab)!
                            }
                        }) {
                            Text(tab)
                                .foregroundColor(currentTabIndex == tabs.firstIndex(of: tab) ? Color.white : Color.black)
                                .padding()
                                .padding(.horizontal)
                                .background(
                                    ZStack{
                                        if (currentTabIndex == tabs.firstIndex(of: tab)){
                                    Color("Primary")
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: tabTransition)
                                        }})
                        }
                    }
                }
                .padding()
            }
            HStack{
                Text("Recently")
                Spacer()
                NavigationLink(destination: FinanceRowView(filter:$filter,finances: finances), label: {
                    Text("See All")
                        .foregroundColor(Color.gray)
                }) 
            }.padding()
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FinanceScreenView()
    }
}
