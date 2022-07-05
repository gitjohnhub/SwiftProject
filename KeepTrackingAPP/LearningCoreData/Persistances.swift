//
//  Persistances.swift
//  LearningCoreData
//
//  Created by Elon on 2022/5/2.
//

import CoreData

class Persistances {
    lazy var persistentContainer:NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Finance")
        container.loadPersistentStores { _, error in
            if let error = error as NSError?{
                fatalError("error:\(error.userInfo)")
            }
        }
        return container
        
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            }catch{
                let error = error as NSError
                fatalError("Error:\(error.userInfo)")
                
            }
        }
    }
}
