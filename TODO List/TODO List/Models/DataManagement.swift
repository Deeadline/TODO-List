//
//  DataManagement.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 01.05.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import Foundation


class DataManagement {

    struct File {
        static let tasks = NSHomeDirectory() + "/Documents/tasks.txt"
    }
    
    static func store(taskManagement : TaskManagement) -> Bool {
        
        do {
            let fileURL = URL(fileURLWithPath: DataManagement.File.tasks)
            let encoder = JSONEncoder()
            let data = try encoder.encode(taskManagement)
            try data.write(to: fileURL)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        return true
    }
    

    static func restoreTaskManagement() -> TaskManagement? {
        
        do {
            
            let fileURL = URL(fileURLWithPath: DataManagement.File.tasks)
            let data = try Data(contentsOf: fileURL)
            let jsonDecoder = JSONDecoder()
            let taskManagement = try jsonDecoder.decode(TaskManagement.self, from: data)
            return taskManagement
            
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        
        return nil
    }
    
}
