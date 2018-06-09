//
//  AddTaskController.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import UIKit

class AddTaskController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addTask(_ sender: UIButton) {
        let newTask = Task(name: textField.text!, status: false)
        TaskManagement.shared.getList(selectedList).addTask(task: newTask)
        textField.text = ""
        textField.placeholder = "Add more?"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
