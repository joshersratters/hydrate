//
//  NewCupViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 25/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit

class NewCupViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cupVolume: UITextField!
    @IBOutlet weak var recents: UITableView!
    @IBOutlet weak var save: UIBarButtonItem!
    
    @IBAction func clear(sender: AnyObject) {
        initialise()
    }
    
    @IBAction func saveCup(sender: AnyObject) {
        
        if cupVolume.editing {
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
    
    //MARK: Texfield Set Up
    func textFieldDidBeginEditing(textField: UITextField) {
        toggleSaveButton()
        println("Begin editing")
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
    
    func toggleSaveButton() {
        if cupVolume.editing {
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
