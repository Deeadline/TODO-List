//
//  AddListController.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import UIKit

class AddListController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addList(_ sender: UIButton) {
        let newList = List(title: textField.text!, tasks: [], status: false)
        TaskManagement.shared.addList(list: newList)
        textField.text = ""
        textField.placeholder = "Add more?"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }  
}
