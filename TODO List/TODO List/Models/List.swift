//
//  List.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 01.05.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import Foundation

class List {
    var name: String
    var tasks: [Task]?
    var completed: Bool
    
    init(name: String, tasks: [Task]?, completed: Bool = false) {
        self.name = name
        self.tasks = tasks
        self.completed = completed
    }

}

class persitedList {
    var lists: [List]?
    
    private static let listsKey = "lists"
}
