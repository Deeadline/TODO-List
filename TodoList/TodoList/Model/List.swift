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
    var tasks: [Task]?

    init(title: String, tasks: [Task]?, status: Bool = false) {
        self.title = title
        self.tasks = tasks
        self.status = status
    }
    
    func setStatus(status: Bool) {
        self.status = status
    }
    func addTask(task: Task){
        tasks?.append(task)
    }
}

struct Task: Codable {
    var name: String
    var status: Bool
}
