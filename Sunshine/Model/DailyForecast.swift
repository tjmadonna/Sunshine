//
//  DailyForecast.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import Foundation

class DailyForecast: NSObject {

    var date: Date?
    var highTemp: Double?
    var lowTemp: Double?
    var pressure: Double?
    var humidity: Int?
    var id: Int?
    var detail: String?
    
    init(dictionary: [String: AnyObject]) {
        if let dateInt = dictionary["dt"] as? Int {
            date = Date(timeIntervalSince1970: dateInt)
        }
        
        if let temp = dictionary["temp"] as? [String: AnyObject] {
            highTemp = temp["max"] as? Double
            lowTemp = temp["min"] as? Double
        } else {
            print("Couldn't find temp")
        }
        
        pressure = dictionary["pressure"] as? Double
        
        humidity = dictionary["humidity"] as? Int
        
        if let weatherArray = dictionary["weather"] as? [[String: AnyObject]], let weather = weatherArray.first {
            id = weather["id"] as? Int
            detail = weather["main"] as? String
        } else {
            print("Couldn't find weather")
        }
    }
    
    static func dailyForecastsFromResults(results: [[String: AnyObject]]) -> [DailyForecast] {
        
        var movies = [DailyForecast]()
        
        // Iterate through array of dictionaries, each Movie is a dictionary
        var index = 0
        for result in results {
            if index == 0 {
                print(result)
                index = index + 1
            }
            movies.append(DailyForecast(dictionary: result))
        }
        
        return movies
    }
    
    
}
