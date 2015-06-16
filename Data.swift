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
    func formatCurrentDate(date: NSDate) -> String {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "YYYY/MM/dd Z"
        let defaultTimeZoneStr = formatter.stringFromDate(date)
        
        return defaultTimeZoneStr
    }
}

struct Constants {
    let cupType: [String] = ["Water", "Squash", "Milk", "Tea", "Coffee"]
}

