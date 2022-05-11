//
//  AddNewTask.swift
//  TaskManager
//
//  Created by Elon on 2022/5/10.
//

import SwiftUI

struct AddNewTask: View {
    @EnvironmentObject var taskModel:TaskViewModel
    // MARK: All Environment Values in one  Variable
    @Environment(\.self) var env
    @Namespace var animation
    var body: some View {
        VStack(spacing: 12.0){
            Text("Edit Task")
                .font(.title.bold())
                .frame(maxWidth:.infinity)
                .overlay(alignment: .leading) {
                    Button {
                        env.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.title3)
                            .foregroundColor(.black)
                    }
                }
            // MARK: Task Color Picker
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Task Color")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                // MARK: Sample Card Color
                let colors: [String] = ["Yellow","Green","Blue","Purple","Red","Orange"]
                
                HStack {
                    ForEach(colors,id: \.self) {color in
                        Circle()
                            .fill(Color(color))
                            .frame(width: 25, height: 25, alignment: .center)
                            .background {
                                if taskModel.taskColor == color {
                                    Circle()
                                        .strokeBorder(.gray)
                                        .padding(-3)
                                }
                            }
                            .contentShape(Circle())
                            .onTapGesture {
                                taskModel.taskColor = color
                            }
                    }
                }
                .padding(.top,10)
            }
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.top,30)
            
            Divider()
                .padding(.vertical,10)
            // MARK: Task Deadline
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Task Deadline")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(taskModel.taskDeadline.formatted(date: .abbreviated, time:.omitted) + ", " + taskModel.taskDeadline.formatted(date: .omitted,time: .shortened))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .padding(.top,10)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                Button(action: {
                    taskModel.showDatePicker.toggle()
                }) {
                    Image(systemName: "calendar")
                        .foregroundColor(.black)
                }
            }
            Divider()
            // MARK: Task Title
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Task Title")
                    .font(.caption)
                    .foregroundColor(.gray)
                TextField("",text: $taskModel.taskTitle)
                    .frame(maxWidth: .infinity)
                    .padding(.top,10)
            }
            .padding(.top,10)
            Divider()
            // MARK: Sample Task Types
            let taskTypes:[String] = ["Basic","Urgent","Important"]
            VStack(alignment: .leading, spacing: 12.0) {
                Text("Task Type")
                    .font(.caption)
                    .foregroundColor(.gray)
                HStack(spacing: 12.0) {
                    ForEach(taskTypes,id:\.self) {taskType in
                        Text(taskType)
                            .font(.callout)
                            .padding(.vertical,8)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(taskModel.taskType == taskType ? .white : .black)
                            .background{
                                if taskModel.taskType == taskType {
                                    Capsule()
                                        .fill(.black)
                                        .matchedGeometryEffect(id: "TYPE", in: animation)
                                }else {
                                    Capsule()
                                        .strokeBorder(.black)
                                }
                            }
                            .contentShape(Capsule())
                            .onTapGesture {
                                withAnimation {
                                    taskModel.taskType = taskType
                                }
                            }
                    }
                }
                .padding(.top,8)
            }
            .padding(.vertical,10)
            Divider()
            
            // MARK: Save Button
            Button(action: {
                // MARK: If Success Closing View
                if taskModel.addTask(context: env.managedObjectContext) {
                    env.dismiss()
                }
            }) {
                Text("Save Task")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background {
                        Capsule()
                            .fill(.black)
                    }
            }
            .frame(maxHeight:.infinity,alignment: .bottom)
            .padding(.bottom, 10)
            .disabled(taskModel.taskTitle == "")
            .opacity(taskModel.taskTitle == "" ? 0.6 : 1)
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .padding()
        .overlay {
            ZStack {
                if taskModel.showDatePicker {
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                        .onTapGesture {
                            taskModel.showDatePicker = false
                        }
                    
                    // MARK: Disabling Past Dates
                    DatePicker.init("", selection: $taskModel.taskDeadline,in:Date.now...Date.distantFuture)
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .padding()
                        .background(.white,in:RoundedRectangle(cornerRadius: 12,style:.continuous))
                        .padding()
                }
            }
            .animation(.easeInOut,value:taskModel.showDatePicker)
        }
    }
}

struct AddNewTask_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTask()
            .environmentObject(TaskViewModel())
    }
}
