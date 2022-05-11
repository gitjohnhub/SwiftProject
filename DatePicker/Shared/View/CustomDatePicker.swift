//
//  CustomDatePicker.swift
//  DatePickerProject (iOS)
//
//  Created by Yi on 2021/12/5.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate:Date
    
    // dateview change by arrow click
    @State var currentMonth:Int = 0
    
    var body: some View {
        VStack(spacing: 35.0) {
            
            // Days...
            let days:[String] = Calendar.current.weekdaySymbols.compactMap { value in
                return String(value.prefix(3))
            }
//            let days:[String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            
            HStack(spacing: 20.0) {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(extraData()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text(extraData()[1])
                        .font(.title.bold())
                }
                Spacer()
                Button {
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            //Day View Sun Mon Tue
            HStack(spacing: 0.0){
                ForEach(days,id:\.self) {day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth:.infinity)
                    
                }
            }
            
            //Dates
            //Lazy grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns,spacing: 15) {
                ForEach(extracDate()) {value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Pink"))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
            VStack(spacing: 20.0) {
                Text("Tasks")
                    .font(.title2.bold())
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .padding(.vertical,20)
                
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    ForEach(task.task){task in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(task.time.addingTimeInterval(CGFloat.random(in: 0...5000)),style:.time)
                            Text(task.title).font(.title2.bold())
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .frame(maxWidth:.infinity,alignment:.leading)
                        .background(Color("Purple").opacity(0.5).cornerRadius(10))
                    }
                }else {
                    Text("NO task found")
                }
            }
            .padding()
            .padding(.top,25)
        }
        .onChange(of: currentMonth) { newValue in
            // updating month...
            currentDate = getCurrentMonth()
            
        }
    }
    
    @ViewBuilder
    func CardView(value:DateValue)->some View {
        VStack {
            if value.day != -1 {
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth:.infinity)

                    Spacer()
                    Circle().fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white: Color("Pink"))
                        .frame(width: 8, height: 8)
                }else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth:.infinity)
                    Spacer()
                }
            }
        }.padding(.vertical,9)
            .frame(height:60,alignment: .top)
    }
    // checking dates
    func isSameDay(date1:Date,date2:Date)->Bool {
        let calendar = Calendar.current
        return calendar.isDate(date1,inSameDayAs: date2)
    }
    // extracting Year and month for display
    func extraData()->[String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth()-> Date {
        let calender = Calendar.current

        // Getting current month date
        guard let currentMonth = calender.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
        
    }
    
    func extracDate()->[DateValue] {
        let calender = Calendar.current

        // Getting current month date
        let currentMonth = getCurrentMonth()
        var days =  currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calender.component(.day, from: date)
            print(day)
            let mydateValue = DateValue(day: day, date: date)
//            print(mydateValue)
            return mydateValue
        }
        // adding offset days to get extact week day
        let firstWeekday = calender.component(.weekday, from: days.first?.date ?? Date())
//        print(days.first!.date,firstWeekday)
        print(firstWeekday)
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
//        print(days)
        
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending Date to get current month dates
extension Date {
    func getAllDates()-> [Date] {
        let calender = Calendar.current
        // getting start date...
        let startDate = calender.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        // 获取当月 日长度 比如12月有31天，返回1..<32
        let range = calender.range(of: .day, in: .month, for: self)!
        let myrangeDate = range.compactMap { day -> Date in
            return calender.date(byAdding: .day, value: day - 1, to: startDate)!
        }
//        print(myrangeDate)
//        range.removeLast()
        return myrangeDate
    }
}
