//
//  Home.swift
//  CustomerSIdeBarProject
//
//  Created by Elon on 2021/12/12.
//

import SwiftUI

struct Home: View {
    @State var currentTab:String = "house"
    @Namespace var animation
    @State var currentHoverID:String = ""
    var body: some View {
        HStack(spacing: 0.0) {
            //Side bar
            VStack(spacing:10){
                ForEach(["house","laptopcomputer","bag","creditcard","gamecontroller","list.star"],id:\.self) {image in
                    MenuButton(image: image)
                }
            }
            .padding(.top,60)
            .frame(width: 85)
            .frame(maxHeight:.infinity,alignment: .top)
            .background(
                ZStack{
                    Color.white.padding(.trailing,30)
                    Color.white.cornerRadius(15)
                }
                    .ignoresSafeArea()
            )
            Spacer()
            
            //home view
            VStack(spacing:15){
                HStack{
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Dashboard")
                            .font(.title.bold())
                            .foregroundColor(.black)
                        Text("Payment updates")
                            .font(.callout)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    //search bar
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .font(.title3)
                            .foregroundColor(.black)
                        TextField("Search",text: .constant("")).frame(width: 150)
                    }
                    .padding(.vertical,8)
                    .padding(.horizontal)
                    .background(.white)
                    .clipShape(Capsule())
                }
                ScrollView(.vertical,showsIndicators: false){
                    RecentsView()
                    AnalyticsView()
                    HistoryView()
                }
                
            }
            .padding(.horizontal,30)
            .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
            
            // graph view
            
        }
        .frame(width: getRect().width / 1.75, height: getRect().height - 130)
        .background(Color.gray.opacity(0.03).ignoresSafeArea())
        .buttonStyle(BorderlessButtonStyle())
        .textFieldStyle(PlainTextFieldStyle())
    }
    
    @ViewBuilder
    func MenuButton(image:String)->some View{
            Image(systemName:image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(currentTab == image ? .black : .gray)
                .frame(width: 22, height: 22)
                .frame(width: 80, height: 50, alignment: .center)
                .overlay(HStack{
                    if currentTab == image {
                        Capsule()
                            .fill(Color.black)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .frame(width: 2,height: 40)
                            .offset(x: 2)
                    }
                }
                         ,alignment: .trailing)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.spring()) {
                        currentTab = image
                    }
                }
    }
    @ViewBuilder
    func RecentsView()->some View{
        ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:15){
                ForEach(recents){recent in
                    VStack(alignment: .leading, spacing: 15.0){
                        HStack(){
                            Image(systemName: recent.image)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 26, height: 26, alignment: .center)
                                .foregroundColor(.black)
                            Spacer()
                            Image(systemName: "dot.square.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height: 16)
                                .foregroundColor(.gray)
                            
                        }
                        
                        Text(recent.title)
                            .foregroundColor(.gray)
                        Text(recent.price)
                            .font(.title2.bold())
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(width: 200)
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 5)                    .shadow(color: Color.black.opacity(0.03), radius: 5, x: -5, y: -5)
                }
            }
            .padding()
        }
    }
    @ViewBuilder
    func AnalyticsView()->some View{
        VStack{
            Text("Balance")
                .font(.callout)
                .foregroundColor(.gray)
            Text("$1500")
                .font(.title.bold())
                .foregroundColor(.black)
            // bar graph
            
        }
        
    }
    @ViewBuilder
    func HistoryView()->some View{
        VStack(alignment: .leading, spacing: 2.0){
            Text("history")
                .font(.title.bold())
                .foregroundColor(.black)
            Text("Transation of last 3 months")
                .font(.callout)
                .foregroundColor(.black)
            VStack(spacing:8){
                ForEach(histories){history in
                    HStack(spacing:15){
                        Image(history.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                            .padding(6)
                            .background(.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.03), radius: 5, x: 5, y: 5)
                        Text(history.description)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment:.leading)
                        Text(history.time)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment:.leading)
                        Text(history.amount)
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment:.leading)
                        Text("Completed")
                            .font(.callout)
                            .foregroundColor(.gray)
                            .frame(maxWidth:.infinity,alignment:.leading)
                            .offset(x:20)
                    }
                    .padding(.vertical,5)
                    .padding(.horizontal)
                    .background(Color.white.opacity(currentHoverID == history.id ? 1 : 0))
                    .cornerRadius(8)
                    .onHover { status in
                        if status {
                            currentHoverID = history.id
                        }else {
                            currentHoverID = ""
                        }
                    }
                    
                }
            }
            .padding(.vertical,25)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.light)
    }
}

//get Screen Frame
extension View{
    func getRect()->CGRect {
        return NSScreen.main!.visibleFrame
    }
}
