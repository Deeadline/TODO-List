//
//  DataManagement.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 01.05.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import Foundation


class DataManagement {
    
    private static let nameKey = "lists"

    //Archive
    private static func archive(_ lists: [List]) -> NSData {
        return NSKeyedArchiver.archivedData(withRootObject: lists) as NSData
    }
    
    // Fetch
    static func fetchList() -> [List]? {
        guard let unarchiveData = UserDefaults.standard.object(forKey: nameKey) as? Data
        else { return nil }
        
        return NSKeyedUnarchiver.unarchiveObject(with: unarchiveData) as? [List]
    }
    
    // Save
    static func save(_ lists: [List]) {
        
        // Archive
        let archivedLists = archive(lists)
        
        // Set object for key
        UserDefaults.standard.set(archivedLists, forKey: nameKey)
        UserDefaults.standard.synchronize()
    }
}
