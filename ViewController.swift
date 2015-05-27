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
    
    var cups = [NSManagedObject]()
    
    @IBOutlet weak var numberOfCupsLabel: UILabel!
    @IBOutlet weak var cupsLabel: UILabel!
    
    @IBAction func addCup(sender: UIButton) {
        
    }
    //MARK: - Actionsheet
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
    
    func updateCupsLabel() {
        if numberOfCupsLabel.text! == "1" {
            cupsLabel.text = "Cup"
        } else {
            cupsLabel.text = "Cups"
        }
    }
    
    func initialiseCupsLabel() {
        cupsLabel.text = "Cup"
        numberOfCupsLabel.text = "1"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseCupsLabel()
        updateCupsLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

