//
//  NewCupViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 25/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit
import CoreData

class NewCupViewController: UIViewController {

    var currentDate: NSDate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var save: UIBarButtonItem!
    
    @IBAction func clear(sender: AnyObject) {
        initialise()
    }
    
    @IBAction func saveCup(sender: AnyObject) {
        
        //Grab current user entered values
        currentDate = datePicker.date
        var date = currentDate!
        
        //Reference app delegate
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference to managed object context
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Cup", inManagedObjectContext: context)
        
        //Create instance of our data model and initialise the data
        var newCup = Cup(entity: entity!, insertIntoManagedObjectContext: context)
        
        //Map our properties
        newCup.time = date
        
        //Save our context
        context.save(nil)
        println("\(newCup)")
        println(datePicker.date)
        
        //Navigate back to root view controller?
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    //Mark: Custom Functions
    func initialise() {
        datePicker.setDate(Date().getCurrentDate(), animated: true)
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
