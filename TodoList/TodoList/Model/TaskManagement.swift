//
//  TaskManagement.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import Foundation

class TaskManagement: Codable {
    static let shared = TaskManagement()

    var completeLists: [List] = []
    var lists: [List] = []
    var moveTo: Bool = false
    
    func setMoveTo(value : Bool) {
        moveTo = value
    }
    
    func addList(list: List, status: Bool = false) {
        if status && moveTo {
            completeLists.append(list)
            return
        }
        lists.append(list)
    }
    
    func removeList(at index: Int, status: Bool = false) -> List{
        if status {
            return completeLists.remove(at: index)
        }
        return lists.remove(at: index)
    }
    
    func save() -> Bool {
        return DataManagement.save(taskManagement: self)
    }
    
    func load() -> Bool {
        guard let restoredTaskManagement = DataManagement.loadData() else {
            return false
        }
        
        self.completeLists = restoredTaskManagement.completeLists
        self.lists = restoredTaskManagement.lists
        return true
    }
    
    func getList() -> [List] {
        return self.lists
    }
}
