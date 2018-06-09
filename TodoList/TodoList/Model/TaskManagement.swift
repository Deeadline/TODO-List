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
    
    func addList(list: List) {

        lists.append(list)
    }
    
    func addToCompleteList(list: List) {
        if moveTo {
            completeLists.append(list)
        }
    }
    
    func removeList(at index: Int){
        lists.remove(at: index)
    }
    
    func removeCompletedList(at index: Int) {
        completeLists.remove(at: index)
    }
    
    func sort(by: Int) {
        if(by == 1){
            lists.sort(by: {$0.status && !$1.status})
        } else {
            lists.sort(by: {!$0.status && $1.status})
        }
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
    
    func getCompletedList(_ row: Int) -> List {
        return self.completeLists[row]
    }
    
    func getCompletedLists() -> [List] {
        return self.completeLists
    }
    
    func getList(_ row: Int) -> List {
        return self.lists[row]
    }
    
    func getLists() -> [List] {
        return self.lists
    }
    
}
