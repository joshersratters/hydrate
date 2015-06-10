//
//  ViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 10/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var cups = [Model]()
    
    @IBOutlet weak var numberOfCupsLabel: UILabel!
    @IBOutlet weak var cupsLabel: UILabel!
    
    @IBAction func addCup(sender: UIButton) {
        
    }
    // Action Sheet
    @IBAction func showActionSheet(sender: AnyObject) {
        let optionMenu = UIAlertController(title: "Share", message: "Share today's progress with Twitter", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let shareAction = UIAlertAction(title: "Share", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) -> Void in
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })

        optionMenu.addAction(shareAction)
        optionMenu.addAction(cancelAction)
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCup()
        updateCupsLabel()
        // Do any additional setup after loading the view, typically from a nib.
        //Reference app delegate
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference to managed object context
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        //Reference to fetch request
        let fetchrequest = NSFetchRequest(entityName: "Cup")

    }
    
    func fetchCup() {
        let fetchRequest = NSFetchRequest(entityName: "Cup")
        
        // Create a sort descriptor object that sorts on the "time"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Model] {
            cups = fetchResults
        }
    }
    
    func updateCupsLabel() {
        numberOfCupsLabel.text! = cups.count.description
        
        if numberOfCupsLabel.text! == "1" {
            cupsLabel.text = "Cup today"
        } else {
            cupsLabel.text = "Cups today"
        }
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        //Reference app delegate
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference to managed object context
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        //Reference to fetch request
        let fetchrequest = NSFetchRequest(entityName: "Cup")
        
        fetchCup()
        updateCupsLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

