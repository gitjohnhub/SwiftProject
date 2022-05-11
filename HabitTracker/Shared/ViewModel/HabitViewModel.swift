//
//  HabitViewModel.swift
//  HabitTracker
//
//  Created by Elon on 2022/5/10.
//

import SwiftUI
import CoreData
import UserNotifications

class HabitViewModel: ObservableObject {
    // MARK: New Habit Properties
    @Published var addNewHabit: Bool = false
    
    @Published var title: String = ""
    @Published var habitColor:String = "Card-1"
    @Published var weekDays:[String] = []
    @Published var isRemainderOn: Bool = false
    @Published var remainderText:String = ""
    @Published var remainderDate: Date = Date()
    
    
    // MARK: Reminder Timer Picker
    @Published var showTimePicker:Bool = false
    // MARK: Editing Habit
    @Published var editHabit:Habit?
    
    // MARK: Adding habit to database
    func addHabit(context: NSManagedObjectContext)async->Bool {
        if let habit = (editHabit == nil) ? Habit(context: context) : editHabit{
            habit.title = title
            habit.color = habitColor
            habit.weekDays = weekDays
            habit.isRemainderOn = isRemainderOn
            habit.remainderText = remainderText
            habit.notificationDate = remainderDate
            habit.notificationIDs = []
            if isRemainderOn{
                // MARK: Scheduling Notifications
                if let ids = try? await scheduleNotification(){
                    habit.notificationIDs = ids
                    if let _ = try? context.save(){
                        return true
                    }
                }
            } else {
                // MARK: Adding Data
                if let _ = try? context.save(){
                    return true
                }
            }
        }
        return false
    }
    // MARK: Notification Access Status
    @Published var notificationAccess: Bool = false
    
    init(){
        requestNotificationAccess()
    }
    func requestNotificationAccess(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.sound,.alert]) { status, _ in
            DispatchQueue.main.async {
                self.notificationAccess = status
            }
        }
    }
    // MARK:Adding Notifications
    func scheduleNotification() async throws -> [String]{
        let content = UNMutableNotificationContent()
        content.title = "Habit Remainder"
        content.subtitle = remainderText
        content.sound = .default
    
        
        // Scheduled Ids
        var notificationIDs: [String] = []
        let calendar = Calendar.current
        let weekdaySymbols:[String] = calendar.weekdaySymbols
        // MARK: Scheduling Notification
        for weekday in weekDays {
            // unique id for each notification
            let id = UUID().uuidString
            let hour = calendar.component(.hour, from: remainderDate)
            let min = calendar.component(.minute, from: remainderDate)
            let day = weekdaySymbols.firstIndex { currentDay in
                return currentDay == weekday
            } ?? -1
            // MARK: Since Week Day Starts from 1-7 adding +1 to index
            if day != -1 {
                var components = DateComponents()
                components.hour = hour
                components.minute = min
                components.weekday = day + 1

                // MARK: thus this will trigger notification on each selected day
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                // MARK: Notification Request
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                try await UNUserNotificationCenter.current().add(request)
                notificationIDs.append(id)
                
            }
           
            
        }
        return notificationIDs
        
    }
    
    // MARK: Erasing content
    func resetData(){
        title = ""
        habitColor = "Card-1"
        weekDays = []
        isRemainderOn = false
        remainderText = ""
        remainderDate = Date()
        editHabit = nil
        
    }
    // MARK: Delete from database
    func deleteHabit(context:NSManagedObjectContext)->Bool{
        if let editHabit = editHabit {
            context.delete(editHabit)
            if let _ = try? context.save(){
                return true
            }

        }
        return false
    }
    // MARK:  Restoring Edit Data
    func restoreEditData(){
        if let editHabit = editHabit {
            title = editHabit.title ?? ""
            habitColor = editHabit.color ?? "Card-1"
            weekDays = editHabit.weekDays ?? []
            isRemainderOn = editHabit.isRemainderOn
            remainderText = editHabit.remainderText ?? ""
            remainderDate = editHabit.notificationDate ?? Date()
        }
    }
   
    
    // MARK: Done Button Status
    func doneStatus()-> Bool {
        let remainderStatus = isRemainderOn ? remainderText == "" : false
        if title == "" || weekDays.isEmpty || remainderStatus{
            return false
        }
        return true
    }
    
}
