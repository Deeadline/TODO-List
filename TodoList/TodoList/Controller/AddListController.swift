//
//  AddListController.swift
//  TodoList
//
//  Created by Mikołaj on 06.06.2018.
//  Copyright © 2018 Mikołaj. All rights reserved.
//

import UIKit

class AddListController: UIViewController {

    //Polecam kumplu robic coś takiego ala segregowanie kodu, co mam na myśli?
    
    
    //tutaj zmienne i referencje
    // MARK: Referencje
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addList(_ sender: UIButton) {
        let newList = List(title: textField.text!, tasks: [], status: false)
        TaskManagement.shared.addList(list: newList)
        textField.text = ""
        textField.placeholder = "Add more?"
        
    }
    
    //tutaj funkcje takie ogolne z dziedziczenia. to jest spoko to wszystko wiecej nie ruszam
    //spoko pozdrawiam :D dzieki za rady :D
    // MARK: Konstruktor
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tutaj eventy
    
    
    
    //tutaj funkcje prywatne, polecam funckej prywatne pisac w stylu
    
    fileprivate func funkcja() {
        // bo to jest dość spoko
    }
    

}
