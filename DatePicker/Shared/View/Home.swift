//
//  Home.swift.swift
//  DatePickerProject (iOS)
//
//  Created by Yi on 2021/12/5.
//

import SwiftUI

struct Home: View {
    @State var currentDate:Date = Date()
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(spacing:20) {
                // Custom date picker
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        .safeAreaInset(edge: .bottom) {
            HStack{
                Button(action: {}) {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth:.infinity)
                        .background(Color("Orange"),in:RoundedRectangle(cornerRadius: 15))
                }
                Button(action: {}) {
                    Text("Add Reminder")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth:.infinity)
                        .background(Color("Orange"),in:Capsule())
                }
            }
            .padding(.horizontal)
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
