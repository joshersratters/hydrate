//
//  ViewController.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 10/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

