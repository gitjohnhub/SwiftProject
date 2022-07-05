//
//  MeetingHeaderView.swift
//  ScrumsApp
//
//  Created by Elon on 2022/4/21.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed:Int
    let secondsRemaining:Int
    let theme:Theme
    private var totalSeconds:Int {
        secondsElapsed + secondsRemaining
    }
    private var progress:Double {
        guard totalSeconds > 0 else { return 1}
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    private var minutesRemaining:Int {
        secondsRemaining / 60
    }
    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgessViewStyle(theme:theme))
            HStack{
                VStack(alignment: .leading){
                    Text("Seconds Elapsed")
                    Label("\(secondsElapsed)",systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("Seconds Remaining")
                    Label("\(secondsRemaining)",systemImage: "hourglass.bottomhalf.fill")

                }
            }
        }
        .padding([.top,.horizontal])
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum)
            .previewLayout(.sizeThatFits)
    }
}
