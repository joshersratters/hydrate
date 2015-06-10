//
//  Cup.swift
//  
//
//  Created by Joshua Ratcliffe on 13/05/2015.
//
//

import Foundation
import CoreData

class Model: NSManagedObject {

    @NSManaged var volume: NSNumber
    @NSManaged var time: NSDate
}

var cups = [NSManagedObject]()

