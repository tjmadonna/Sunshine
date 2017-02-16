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

    convenience init?(city: City, context: NSManagedObjectContext) {
        if let entry = NSEntityDescription.entity(forEntityName: "Location", in: context),
            let id = city.id,
            let name = city.name {
            self.init(entity: entry, insertInto: context)
            self.id = Int64(id)
            self.name = name
        } else{
            return nil
        }
    }
    
}
