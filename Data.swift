//
//  Data.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 25/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import Foundation

func getCurrentDate() -> NSDate {
    var date = NSDate()
    var formatter = NSDateFormatter()

    return date
}


struct Date {
    //Properties
    var currentDate = NSDate()
    
    //Methods
    func getCurrentDate() -> NSDate {
        var date = NSDate()
        
        return date
    }
    
    func formatCurrentDate(date: NSDate) -> NSDate {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss dd/MM/YYYY zzzz"
        let defaultTimeZoneStr = formatter.stringFromDate(date)
        
        return date
    }
}

struct Constants {
    let cupType: [String] = ["Water", "Squash", "Milk", "Tea", "Coffee"]
}

