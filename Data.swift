//
//  Data.swift
//  Hydrate
//
//  Created by Joshua Ratcliffe on 25/05/2015.
//  Copyright (c) 2015 Joshua Ratcliffe. All rights reserved.
//

import Foundation

struct Date {
    //Properties
    var currentDate = NSDate()
    let timeZone = NSTimeZone.systemTimeZone()

    //Methods
    func formatCurrentDate(date: NSDate) -> NSDate {
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        let systemTimeZoneStr = formatter.stringFromDate(date)
        formatter.timeZone = NSTimeZone(abbreviation: "\(timeZone)")
        let systemTimeZoneNs: NSDate = formatter.dateFromString(systemTimeZoneStr)!
        
        return systemTimeZoneNs
    }
}

struct Constants {
    let cupType: [String] = ["Water", "Squash", "Milk", "Tea", "Coffee"]
}

