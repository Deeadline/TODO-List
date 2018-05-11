//
//  AllListController.swift
//  TODO List
//
//  Created by Mikołaj Szymański on 30.04.2018.
//  Copyright © 2018 a103. All rights reserved.
//

import UIKit

class AllListController: UITableViewController {
    
    var taskManagement = TaskManagement() {
    didSet {
      DataManagement.fetchList()
    }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
               // Setting up alert controller
               let alertController = UIAlertController(title: "Add List", message: nil, preferredStyle: .alert)
        
                // Set up actions
               let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            
                            // Grab text field text
                        guard let name = alertController.textFields?.first?.text else { return }
            
                           // Create task
                          let newList = List(name: name, tasks: nil, completed: false)
            
                       // Add task
                       self.taskManagement.addList(list: newList, completed: false)
        
                      // Reload data in table view
                      let indexPath = IndexPath(row: 0, section: 0)
                       self.tableView.insertRows(at: [indexPath], with: .automatic)
                       self.tableView.reloadData()                
                  }
        
        addAction.isEnabled = false
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            
            // Add the text field
                alertController.addTextField { UITextField in
                  UITextField.placeholder = "Enter list name..."
                  UITextField.addTarget(self, action: #selector(self.handleTextChanged), for: .editingChanged)
                            
        }
            // Add the actions
                alertController.addAction(addAction)
                alertController.addAction(cancelAction)
        
            // Present
                present(alertController, animated: true)
        
   }
    
    @objc private func handleTextChanged(_ sender: UITextField) {
        
                    // Grab the alert controller and add action
                guard let alertController = presentedViewController as? UIAlertController,
                let addAction = alertController.actions.first,
                let text = sender.text
                else { return }
        
                // Enable add action based on if text is empty or contains whitespace
                addAction.isEnabled = !text.trimmingCharacters(in: .whitespaces).isEmpty
   }
    
   override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, sourceView, completionHandler) in

            var completedList = false
            
            if indexPath.section == 1 {
                completedList = true
            }
            
            // Remove the task from the appropriate array
            self?.taskManagement.removeList(at: indexPath.row, completed: completedList)
            
            // Reload table view
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
                        
            // Indicate that the action was performed
            completionHandler(true)
            
        }
        
        deleteAction.title = "Delete"
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.09019607843, blue: 0.2666666667, alpha: 1)
        
        return UISwipeActionsConfiguration(actions:[deleteAction])
    }
        
        deleteAction.title = "Delete"
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.09019607843, blue: 0.2666666667, alpha: 1)
        
        return UISwipeActionsConfiguration(actions:[deleteAction])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "taskSegue":
                if let cell = sender as? UITableViewCell {
                    let indexPath = tableView.indexPath(for: cell)
                    }
                default: break
                }
        }
    }
}

extension AllListController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRowsInSection: Int = 0
        if section == 0 {
            numberOfRowsInSection = taskManagement.incompleteLists.count
        } else if section == 1 {
            numberOfRowsInSection = taskManagement.completeLists.count
        }
        return numberOfRowsInSection
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        if indexPath.section == 0 {
            cell.textLabel?.text = taskManagement.incompleteLists[indexPath.row].name
        } else if indexPath.section == 1 {
            cell.textLabel?.text = taskManagement.incompleteLists[indexPath.row].name
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "To-Do" : "Done"
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .normal, title: "Done") { [weak self] (action, sourceView, completionHandler) in
            
            // Reload table view
            let doneList: List = TaskManagement.shared.removeList(at: indexPath.row, completed: false)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            // Reload table view
            TaskManagement.shared.addList(list: doneList, completed: true)
            self?.tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            

            // Indicate the action was performed
            completionHandler(true)
        }

        doneAction.backgroundColor = #colorLiteral(red: 0, green: 0.9019607843, blue: 0.462745098, alpha: 1)

        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
}
    

