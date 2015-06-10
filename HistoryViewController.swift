//
//  HistoryViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 13/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//http://jamesonquave.com/blog/core-data-in-swift-tutorial-part-1/

import UIKit
import CoreData
class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Create an empty array of Cups
    var cups = [Cup]()
    
    var date = NSDate()
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var historyDate: UILabel!
    
    @IBAction func doneModal(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func selectDate(sender: AnyObject) {
    }
    
    @IBAction func today(sender: AnyObject) {
    }
    
    @IBAction func previousDay(sender: AnyObject) {
    }
    
    @IBAction func nextDay(sender: AnyObject) {
    }
    
    //MARK: Tableview
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cups.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID: String = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! UITableViewCell
        
        // Get the cup for this index
        let cup = cups[indexPath.row]
        let cuplabel = cups[indexPath.row].description
        // Set the title of the cell to be the volume (description) of the cup
        cell.textLabel?.text = cup.time.description
        cell.detailTextLabel?.text = cuplabel
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title : String = "History"
        return title
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        fetchCup()
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
    }

    func fetchCup() {
        let fetchRequest = NSFetchRequest(entityName: "Cup")
        
        // Create a sort descriptor object that sorts on the "time"
        // property of the Core Data object
        let sortDescriptor = NSSortDescriptor(key: "time", ascending: false)
        
        // Set the list of sort descriptors in the fetch request,
        // so it includes the sort descriptor
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Cup] {
            cups = fetchResults
        }
    }

     override func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }
    
}

