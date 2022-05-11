//
//  AddNewHabit.swift
//  HabitTracker
//
//  Created by Elon on 2022/5/10.
//

import SwiftUI

struct AddNewHabit: View {
    @EnvironmentObject var  habitModel: HabitViewModel
    @Environment(\.self) var env
    // MARK: Environment Values
    var body: some View {
        NavigationView {
            VStack(spacing: 15.0) {
                TextField("Title",text: $habitModel.title)
                    .padding(.horizontal)
                    .padding(.vertical,10)
                    .background(Color.gray.opacity(0.4),in:RoundedRectangle(cornerRadius: 6, style: .continuous))
                
                // MARK: Habit Color Picker
                HStack(spacing: 0) {
                    ForEach(1...7,id:\.self){index in
                        let color = "Card-\(index)"
                        Circle()
                            .fill(Color(color))
                            .frame(width: 30, height: 30)
                            .overlay {
                                if color == habitModel.habitColor{
                                    Image(systemName: "checkmark")
                                        .font(.caption.bold())
                                }
                            }
                            .onTapGesture(perform: {
                                withAnimation {
                                    habitModel.habitColor = color
                                }
                            })
                            .frame(maxWidth:.infinity)
                    }
                }
                .padding(.vertical)
                
                Divider()
                
                // MARK: Frequency Selection
                VStack(alignment: .leading, spacing: 6) {
                    Text("Frequency")
                        .font(.callout.bold())
                    let weekDays = Calendar.current.weekdaySymbols
                    HStack(spacing: 10) {
                        ForEach(weekDays, id:\.self){day in
                            let index = habitModel.weekDays.firstIndex {value in
                                return value == day
                            } ?? -1
                            Text(day.prefix(2))
                                .fontWeight(.semibold)
                                .frame(maxWidth:.infinity)
                                .padding(.vertical,12)
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(index != -1 ? Color(habitModel.habitColor) : Color.gray.opacity(0.4))
                                }
                                .onTapGesture {
                                    withAnimation {
                                        if index != -1 {
                                            habitModel.weekDays.remove(at: index)
                                        } else {
                                            habitModel.weekDays.append(day)
                                        }
                                    }
                                }
                        }
                    }
                    HStack(spacing: 10.0){
                        ForEach(weekDays,id:\.self){day in
                            let index = habitModel.weekDays.firstIndex { value in
                                return value == day
                            } ?? -1
                            Text(day.prefix(2))
                                .frame(maxWidth:.infinity)
                                .padding(.vertical,10)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(index == -1 ? Color.gray : Color.red)
                                )
                                .onTapGesture {
                                    if index != -1 {
                                        habitModel.weekDays.remove(at: index)
                                    } else {
                                        habitModel.weekDays.append(day)
                                    }
                                }
                        }
                    }
                    .padding(.top,15)
                }
                
                Divider()
                    .padding(.vertical, 10)
                // MARK: Notifation toggle
                // MARK: Hiding if notification access is rejected
                HStack{
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Remainder")
                            .fontWeight(.semibold)
                        Text("Just notification")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth:.infinity,alignment: .leading)
                    Toggle(isOn: $habitModel.isRemainderOn) {
                        
                    }
                    .labelsHidden()
                }
                .opacity(habitModel.notificationAccess ? 1 : 0)
                
                HStack(spacing: 12.0){
                    Label {
                        Text(habitModel.remainderDate.formatted(date: .omitted,time: .shortened))
                    } icon: {
                        Image(systemName: "clock")
                    }
                    .padding(.horizontal)
                    .padding(.vertical,12)
                    .background(Color.gray.opacity(0.4),in: RoundedRectangle(cornerRadius: 6, style: .continuous))
                    .onTapGesture {
                        withAnimation {
                            habitModel.showTimePicker.toggle()
                        }
                    }
                    
                    TextField("Reminder Text",text:$habitModel.remainderText)
                        .padding(.horizontal)
                        .padding(.vertical,10)
                        .background(Color.gray.opacity(0.4),in:RoundedRectangle(cornerRadius: 6, style: .continuous))
                    

                }
                .frame(height:habitModel.isRemainderOn ? nil : 0)
                .opacity(habitModel.isRemainderOn ? 1 : 0)
                .opacity(habitModel.notificationAccess ? 1 : 0)

            }
            .animation(.easeInOut, value: habitModel.isRemainderOn)
            .frame(maxHeight:.infinity,alignment: .top)
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(habitModel.editHabit != nil ? "Edit Habit" : "Add Habit")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        env.dismiss()

                    }) {
                        Image(systemName: "xmark.circle")
                    }
                    .tint(.white)
                }
                // MARK: delete button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if habitModel.deleteHabit(context: env.managedObjectContext) {
                            env.dismiss()
                        }

                    }) {
                        Image(systemName: "trash")
                    }
                    .tint(.red)
                    .opacity(habitModel.editHabit == nil ? 0 : 1)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        Task {
                            if await habitModel.addHabit(context: env.managedObjectContext){
                                env.dismiss()
                            }
                        }
                    }
                    .tint(.white)
                    .disabled(!habitModel.doneStatus())
                    .opacity(habitModel.doneStatus() ? 1 : 0.6)
                }
            }
        }
        .overlay{
            if habitModel.showTimePicker {
                ZStack{
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                habitModel.showTimePicker.toggle()
                            }
                        }
                    
                    DatePicker.init("", selection: $habitModel.remainderDate,displayedComponents: [.hourAndMinute])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                        }
                        .padding()
                }
            }
        }
        
    }
}

struct AddNewHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabit()
            .environmentObject(HabitViewModel())
            .preferredColorScheme(.dark)
    }
}
