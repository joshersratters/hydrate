//
//  NewCupViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 25/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit

class NewCupViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cupVolume: UITextField!
    @IBOutlet weak var recents: UITableView!
    @IBOutlet weak var save: UIBarButtonItem!
    
    @IBAction func clear(sender: AnyObject) {
        initialise()
    }
    
    @IBAction func saveCup(sender: AnyObject) {
        
        if cupVolume.editing == true {
            toggleSaveButton()
        } else {
        var store: Double = (cupVolume.text as NSString).doubleValue
        println("\(store)")
            
        }
    }
    
    func initialise() {
        datePicker.setDate(currentDate, animated: true)
        cupVolume.text = nil
        cupVolume.delegate = self
        toggleSaveButton()
    }
    
    //MARK: Texfield
    func textFieldDidBeginEditing(textField: UITextField) {
        toggleSaveButton()
        println("Begin editing")
        save.style = UIBarButtonItemStyle.Done
        save.title = "Done"
        self.navigationItem.rightBarButtonItem?.title = "Done"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        cupVolume.resignFirstResponder()
        println("Should return")
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if cupVolume.hasText() {
           
        }
        
        println("End editing")
    }
    
    //MARK: Tableview
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title : String = "Recents"
        return title
    }
    
    func toggleSaveButton() {
        if cupVolume.editing == true {
            save.style = UIBarButtonItemStyle.Done
            save.title = "Done"
        } else {
            save.style = UIBarButtonItemStyle.Done
            save.title = "Save"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
