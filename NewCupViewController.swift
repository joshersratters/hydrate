//
//  NewCupViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 25/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit
import CoreData

class NewCupViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    //var currentDate = Date()
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cupVolume: UITextField!
    @IBOutlet weak var recents: UITableView!
    @IBOutlet weak var save: UIBarButtonItem!
    
    @IBAction func tapOutside(sender: AnyObject) {
        if cupVolume.isFirstResponder() {
            cupVolume.resignFirstResponder()
        }
    }
    
    @IBAction func clear(sender: AnyObject) {
        initialise()
    }
    
    @IBAction func saveCup(sender: AnyObject) {
        
        if cupVolume.isFirstResponder() {
            cupVolume.resignFirstResponder()
            toggleSaveButton()
        } else if !cupVolume.isFirstResponder() && cupVolume.hasText() {
            var store: Double = (cupVolume.text as NSString).doubleValue
            navigationController?.popViewControllerAnimated(true)
            println("\(store)")
        } else {
            let alertController = UIAlertController(title: "No Data", message: "Either no data is present or invalid", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func toggleSaveButton() {
        if cupVolume.isFirstResponder() {
            save.title = "Done"
        } else {
            save.title = "Save"
        }
    }
    
    func initialise() {
        datePicker.setDate(Date().getCurrentDate(), animated: true)
        cupVolume.text = nil
        cupVolume.delegate = self
        toggleSaveButton()
        
    }
    
    func saveVolume(volume: String) {
        //1
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity = NSEntityDescription.entityForName("volume", inManagedObjectContext: managedContext)
        let volume = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //3
        Cup.setValue(volume, forKey: "volume")
        
        //4
        var error: NSError?
        if !managedContext.save(&error) {
            println("Could not save \(error), \(error?.userInfo)")
        }
        
        cups.append(volume)
    }

    
    //MARK: Texfield
    func textFieldDidBeginEditing(textField: UITextField) {
        println("Begin editing")
        toggleSaveButton()
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        cupVolume.resignFirstResponder()
        println("Should return")
        toggleSaveButton()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        toggleSaveButton()
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
        let title : String = "Recent entries"
        return title
    }
    //MARK: System Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    override func viewDidAppear(animated: Bool) {
        Date().getCurrentDate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
