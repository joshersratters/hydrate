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
    
    var cupHistory: Array<AnyObject> = []
    
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
        return cupHistory.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID: String = "cell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! UITableViewCell
            
        var data: NSManagedObject = (cupHistory[indexPath.row] as? NSManagedObject)!
        cell.textLabel?.text = data.valueForKey("volume") as? String
        //cell.detailTextLabel?.text = data.valueForKey("volume") as? String
        
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title : String = "History"
        return title
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        //Reference app delegate
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        //Reference to managed object context
        let context: NSManagedObjectContext = appDelegate.managedObjectContext!
        
        //Reference to fetch request
        let fetchrequest = NSFetchRequest(entityName: "Cup")
        
        cupHistory = context.executeFetchRequest(fetchrequest, error: nil)!
        tableView.reloadData()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
