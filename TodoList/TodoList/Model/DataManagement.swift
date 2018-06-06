//
//  DataManagement.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import Foundation

class DataManagement {
    static let filePath = NSHomeDirectory() + "/Documents/tasks.txt"
    
    static func save(taskManagement: TaskManagement) -> Bool {
        do{
            let fileURL = URL(fileURLWithPath: filePath)
            let encoder = JSONEncoder()
            let data = try encoder.encode(taskManagement)
            try data.write(to: fileURL)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return true
    }
    
    static func loadData() -> TaskManagement? {
        do {
            let fileURL = URL(fileURLWithPath: filePath)
            let data = try Data(contentsOf: fileURL)
            let jsonDecoder = JSONDecoder()
            let taskManagement = try jsonDecoder.decode(TaskManagement.self, from: data)
            return taskManagement
        } catch{
            print("Error: \(error.localizedDescription)")
        }
        return nil
    }
    
}
