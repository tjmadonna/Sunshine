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
    var conditionId: Int?
    var conditionDescription: String?
    
    init(dictionary: [String: AnyObject]) {
        if let dateInt = dictionary[OpenWeatherClient.JSONResponseKeys.Date] as? Int {
            date = Date(timeIntervalSince1970: dateInt)
        }
        
        if let temp = dictionary[OpenWeatherClient.JSONResponseKeys.Temperature] as? [String: AnyObject] {
            highTemp = temp[OpenWeatherClient.JSONResponseKeys.HighTemperature] as? Double
            lowTemp = temp[OpenWeatherClient.JSONResponseKeys.LowTemperature] as? Double
        } else {
            print("Couldn't find temperature")
        }
        
        pressure = dictionary["pressure"] as? Double
        
        humidity = dictionary["humidity"] as? Int
        
        if let weatherArray = dictionary[OpenWeatherClient.JSONResponseKeys.Weather] as? [[String: AnyObject]], let weather = weatherArray.first {
            conditionId = weather[OpenWeatherClient.JSONResponseKeys.ConditionId] as? Int
            conditionDescription = weather[OpenWeatherClient.JSONResponseKeys.ConditionDescription] as? String
        } else {
            print("Couldn't find weather")
        }
    }
    
    static func dailyForecastsFromResults(results: [[String: AnyObject]]) -> [DailyForecast] {
        
        var forecasts = [DailyForecast]()
        
        // Iterate through array of dictionaries, each daily forecast is a dictionary
        for result in results {
            forecasts.append(DailyForecast(dictionary: result))
        }
        
        return forecasts
    }
    
    
}
