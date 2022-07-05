//
//  Home.swift
//  SleepApp (iOS)
//
//  Created by Elon on 2022/6/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Today")
                        .font(.title.bold())
                    Text("Good morning! Justine")
                        .foregroundColor(.gray)
                }
                .frame(maxWidth:.infinity,alignment: .leading)
                Button {
                    
                }label: {
                    Image(systemName: "square.and.arrow.up.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                }
            }
            SleepTimeSlider()
                .padding(.top,50)
        }
        .padding()
        // Moving to top without Spacer
        .frame(maxHeight:.infinity,alignment: .top)
    }
    
    // MARK: Sleep Time Circular Slider
    @ViewBuilder
    func SleepTimeSlider()->some View {
        
        GeometryReader{proxy in
            ZStack {
                Circle()
                    .stroke(.black.opacity(0.06),lineWidth: 40)
            }
        }
        .frame(width: screenBounds().width / 1.6, height: screenBounds().width / 1.6)
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    // MARK: Screen Bounds Extension
    func screenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}
