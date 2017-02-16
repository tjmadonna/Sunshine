//
//  City.swift
//  Sunshine
//
//  Created by Tyler Madonna on 2/12/17.
//  Copyright © 2017 Tyler Madonna. All rights reserved.
//

import Foundation

class City: NSObject {
    
    var id: Int?
    var name: String?
    
    init(dictionary: [String: AnyObject]) {
        
        if let cityId = dictionary[OpenWeatherClient.JSONResponseKeys.CityId] as? Int {
            self.id = cityId
        }
        
        if let cityName = dictionary[OpenWeatherClient.JSONResponseKeys.CityName] as? String {
            self.name = cityName
        }
        
    }
    
    init(location: Location) {
        self.id = Int(location.id)
        self.name = location.name
    }
    
}
