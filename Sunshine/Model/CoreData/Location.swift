//
//  Location.swift
//  Sunshine
//
//  Created by Tyler Madonna on 2/11/17.
//  Copyright © 2017 Tyler Madonna. All rights reserved.
//

import Foundation
import CoreData

@objc(Location)
public class Location: NSManagedObject {

    convenience init?(dictionary: [String: AnyObject], context: NSManagedObjectContext) {
        if let entry = NSEntityDescription.entity(forEntityName: "Location", in: context),
            let id = dictionary["id"] as? Int64,
            let name = dictionary["name"] as? String {
            self.init(entity: entry, insertInto: context)
            self.id = id
            self.name = name
        } else{
            return nil
        }
    }
    
}
