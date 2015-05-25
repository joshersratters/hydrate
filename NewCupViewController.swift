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
    
    @IBAction func volumeTapped(sender: AnyObject) {
        
    }
    
    @IBAction func clear(sender: AnyObject) {
        initialise()
    }
    
    @IBAction func saveCup(sender: AnyObject) {
        var temp: String = cupVolume.text
        println("\(temp)")
    }
    
    func initialise() {
        datePicker.setDate(currentDate, animated: true)
        cupVolume.text = nil
        cupVolume.delegate = self
    }
    
    //MARK: Texfield Set Up
    func textFieldDidBeginEditing(textField: UITextField) {
        save.enabled = false
        println("Begin editing")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        cupVolume.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        if cupVolume.hasText() {
            save.enabled = true
        }
        
        println("End editing")
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
