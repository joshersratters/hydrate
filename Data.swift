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
    var currentDate = NSDate() // Users system date (no context)
    let timeZone = NSTimeZone.systemTimeZone() // Users system time zone
    let userCalendar = NSCalendar.currentCalendar() // Users calendar/date (context)

    //Methods
    func formatCurrentDate(date: NSDate) -> NSDate {
        let rawDate = date
        
        // Define what components we need
        let requestedDateComponents: NSCalendarUnit = .CalendarUnitYear |
            
            .CalendarUnitMonth |
            
            .CalendarUnitDay |
            
            .CalendarUnitHour |
            
            .CalendarUnitMinute |
            
            .CalendarUnitSecond |
            
            .CalendarUnitNanosecond |
            
            .CalendarUnitEra |
            
            .CalendarUnitWeekday |
            
            .CalendarUnitWeekdayOrdinal
        
        // Start extracting date components from raw NSDate
        let dateComponents = userCalendar.components(requestedDateComponents, fromDate: rawDate)
        
        // Construct variables of date components
        let day = dateComponents.day
        let month = dateComponents.month
        let year = dateComponents.year
        let hour = dateComponents.hour
        let minute = dateComponents.minute
        let second = dateComponents.second
        let nanosecond = dateComponents.nanosecond
        let era = dateComponents.era
        
        // Apply components back into NSDate
        let formattedDate: NSDate = NSCalendar().dateWithEra(era, year: year, month: month, day: day, hour: hour, minute: minute, second: second, nanosecond: nanosecond)!
        
        return formattedDate
    }
}

struct Constants {
    let cupType: [String] = ["Water", "Squash", "Milk", "Tea", "Coffee"]
}

