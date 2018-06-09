//
//  CurrentListsController.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import UIKit

var selectedList = 0

class CurrentListsController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedList = indexPath.row
        performSegue(withIdentifier: "showList", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManagement.shared.getLists().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = TaskManagement.shared.getList(selectedList).getListTitle()
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = deleteAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delete])
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let _changeStatus = changeStatus(at: indexPath)
        return UISwipeActionsConfiguration(actions: [_changeStatus])
    }
    func changeStatus(at indexPath: IndexPath) -> UIContextualAction {
        let list = TaskManagement.shared.getList(indexPath.row)
        let action = UIContextualAction(style: .destructive, title: "Change Status"){ (action,view,completion) in
            list.setStatus(status: true)
            self.tableView.reloadData()
            completion(true)
        }
        action.backgroundColor = .green
        return action
    }
    func deleteAction(at indexPath: IndexPath) -> UIContextualAction {
        let list = TaskManagement.shared.getList(indexPath.row)
        let action = UIContextualAction(style: .destructive, title: "Delete"){ (action,view,completion) in
            if(list.getListStatus()){
                TaskManagement.shared.addToCompleteList(list: list)
            }
            TaskManagement.shared.removeList(at: indexPath.row)
            self.tableView.reloadData()
            completion(true)
        }
        action.backgroundColor = .red
        return action
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
