//
//  TaskManagement.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 30.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import Foundation

class TaskManagement {
    var lists: [List] = []
    var completeLists: [List] { return lists.filter{$0.completed} }
    var incompleteLists: [List] { return lists.filter{!$0.completed} }
    
    
    func addList(list: List, completed: Bool = false) {
        
        lists.append(list)
    }
    
    func removeList(at index: Int, completed: Bool = false) -> List {
        return lists.remove(at: index)
    }
    
    static let shared = TaskManagement()
}


