//
//  SettingsController.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    
    @IBOutlet weak var sortSwitch: UISwitch!
    
    @IBOutlet weak var sortText: UILabel!
    
    @IBOutlet weak var addListSwitch: UISwitch!
    
    @IBOutlet weak var addListText: UILabel!
    
    
    @IBAction func sortToggled(_ sender: UISwitch) {
        changeSortText()
    }
    
    
    @IBAction func addToggled(_ sender: UISwitch) {
        changeAddListText()	
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeSortText()
        changeAddListText()
        sortSwitch.addTarget(self, action: #selector(sortToggled(_:)), for: UIControlEvents.valueChanged)
        addListSwitch.addTarget(self, action: #selector(addToggled(_:)), for: UIControlEvents.valueChanged)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func changeSortText(){
        if sortSwitch.isOn{
            sortText.text = "Sort by completed task"
            TaskManagement.shared.sort(by: 1) // sort asc
        } else {
            sortText.text = "Sort by incompleted task"
            TaskManagement.shared.sort(by: 0) // desc
        }
    }
    func changeAddListText(){
        if addListSwitch.isOn {
            addListText.text = "Add completed list to all list"
            TaskManagement.shared.setMoveTo(value: true)
        } else {
            addListText.text = "Remove list permamently"
            TaskManagement.shared.setMoveTo(value: false)
        }
    }

}
