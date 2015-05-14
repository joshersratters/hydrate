//
//  ViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 10/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var numberOfCupsLabel: UILabel!
    @IBOutlet weak var cupsLabel: UILabel!
    
    @IBAction func addCup(sender: UIButton) {
        numberOfCupsLabel.text = "2"
        updateCupsLabel()
        println("Button pressed")
    }
    //MARK: - Actionsheet
    @IBAction func showActionSheet(sender: AnyObject) {
        let optionMenu = UIAlertController(title: "test", message: "this is a test", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) -> Void in
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {
            (alert: UIAlertAction!) -> Void in
        })

        optionMenu.addAction(deleteAction)
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
    
    func initialiseVariables() {
        cupsLabel.text = "Cup"
        numberOfCupsLabel.text = "1"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initialiseVariables()
        updateCupsLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

