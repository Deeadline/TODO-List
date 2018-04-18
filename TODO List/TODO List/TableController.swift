//
//  TableController.swift
//  TODO List
//
//  Created by a103 on 18.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import UIKit

class TableController: UITableViewController {

    var myList = [String]()
    override func viewDidLoad() {
        	super.viewDidLoad()
        
        self.navigationItem.title = "TODO List"
        myList += ["Jeden", "Dwa", "Trzy", "Cztery"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myList.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueFromTable", sender: self)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        struct staticVariable { static var tableIdentifier = "TableIdentifier" }
        
        var cell:UITableViewCell? = tableView.dequeueReusableCell(
            withIdentifier: staticVariable.tableIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: staticVariable.tableIdentifier)
        }
        
        cell?.textLabel?.text = myList[indexPath.row]
        return cell!
    }
}
