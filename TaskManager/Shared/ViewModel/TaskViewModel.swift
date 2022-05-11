//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by Elon on 2022/5/10.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab:String = "Today"
    
    // MARK: New Task Properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle:String = ""
    @Published var taskColor:String = "Yellow"
    @Published var taskDeadline:Date = Date()
    @Published var taskType:String = "Basic"
    @Published var showDatePicker: Bool = false
    @Published var isCompleted: Bool = false
    
    // MARK: Editing Existing Task Data
    @Published var editTask:Task?
    
    //MARK: Setup edit task
    func setupTask(){
        if let editTask = editTask {
            taskTitle = editTask.title ?? ""
            taskColor = editTask.color ?? "Yellow"
            taskType = editTask.type ?? "Basic"
            taskDeadline = editTask.deadline ?? Date()
        }
    }

    // MARK: Add Task to core data
    func addTask(context: NSManagedObjectContext)->Bool {
        // MARK: Updating Existing Data in Core Data
        var task: Task!
        if let editTask = editTask {
            task = editTask
        }else {
            task = Task(context:context)
        }
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    func resetTaskData() {
        taskType = "Basic"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
    }
}
