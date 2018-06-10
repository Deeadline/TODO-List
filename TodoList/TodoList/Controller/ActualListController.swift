//
//  ActualListController.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import UIKit
var selectedTask = 0

class CustomCell : UITableViewCell {
    
    @IBOutlet weak var myText: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    
    @IBOutlet weak var myButton: UIButton!
    
    
    @IBAction func changeImage(_ sender: UIButton) {
        if myImage?.image == #imageLiteral(resourceName: "unchecked") {
            TaskManagement.shared.getList(selectedList).setTaskStatus(status: true, selectedTask)
           myImage?.image = #imageLiteral(resourceName: "checked")
        } else {
            TaskManagement.shared.getList(selectedList).setTaskStatus(status: false, selectedTask)
            myImage?.image = #imageLiteral(resourceName: "unchecked")
        }
    }
}

class ActualListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if TaskManagement.shared.sort == true {
            TaskManagement.shared.getList(selectedList).sort(true)
        } else {
            TaskManagement.shared.getList(selectedList).sort(false)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTask = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManagement.shared.getList(selectedList).getTasks().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CustomCell = self.tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        cell.myText?.text = TaskManagement.shared.getList(selectedList).getTaskTitle(indexPath.row)
        if TaskManagement.shared.getList(selectedList).getTaskStatus(indexPath.row) == true {
            cell.myImage?.image = #imageLiteral(resourceName: "checked")
        } else {
            cell.myImage?.image = #imageLiteral(resourceName: "unchecked")
        }
        return cell
    }
        
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            TaskManagement.shared.getList(selectedList).removeTask(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
