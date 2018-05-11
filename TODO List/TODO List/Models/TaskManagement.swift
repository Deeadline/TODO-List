//
//  TaskManagement.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 30.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import Foundation

class TaskManagement : Codable {

    static let shared = TaskManagement()

    var completeLists: [List] = []
    var incompleteLists: [List] = []
    
    
    func addList(list: List, completed: Bool = false) {
        if completed {
            completeLists.append(list)
            return
        }
        
        incompleteLists.append(list)
    }
    
    func removeList(at index: Int, completed: Bool = false) -> List {
        if completed {
            return completeLists.remove(at: index)
        }
        
        return incompleteLists.remove(at: index)
    }
    
    func store() -> Bool {
        return DataManagement.store(taskManagement: self)
    }
    
    func load() -> Bool {
        
        guard let restoredTaskManagement = DataManagement.restoreTaskManagement() else {
            return false
        }
        
        self.completeLists = restoredTaskManagement.completeLists
        self.incompleteLists = restoredTaskManagement.incompleteLists
        return true
    }
    
}


