//
//  List.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import Foundation

class List : Codable {
    var title:String
    var status:Bool
    var tasks: [Task]

    init(title: String, tasks: [Task], status: Bool = false) {
        self.title = title
        self.tasks = tasks
        self.status = status
    }
    
    func setStatus(status: Bool) {
        self.status = status
    }
    
    func addTask(task: Task){
        tasks.append(task)
    }
    
    func getTasks() -> [Task] {
        return tasks
    }
    
    func getTask(_ index: Int) -> Task {
        return tasks[index]
    }
    
    func removeTask(at index: Int, status: Bool = false){
        tasks.remove(at: index)
    }
    
    func getListTitle() -> String {
        return self.title
    }
    
    func getListStatus() -> Bool {
        return self.status
    }
    
    func getTaskTitle(_ index: Int) -> String? {
        if tasks.count > 0 {
            return tasks[index].name
        }
        return nil
    }
    
    func getTaskStatus(_ index: Int) -> Bool? {
        if tasks.count > 0 {
            return tasks[index].status
        }
        return nil
    }
    
    func setTaskStatus(status: Bool, _ index: Int) {
        if tasks.count > 0 {
            tasks[index].status = status
        }
    }
}

struct Task: Codable {
    var name: String
    var status: Bool
}
