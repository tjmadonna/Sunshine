//
//  OpenWeatherConvenience.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import Foundation

// MARK: - OpenWeatherClient (Convenience Functions)

extension OpenWeatherClient {
    
    func getForecastFor(cityName: String, completionHandlerForForecast: @escaping (_ results: [DailyForecast]?, _ error: NSError?) -> Void) {
        
        let parameters: [String: String] = [
            ParameterKeys.CityName: cityName,
            ParameterKeys.Format: Constants.JSONFormat,
            ParameterKeys.NumberOfDays: String(14),
            ParameterKeys.Units: Constants.ImperialUnits,
            ]
        
        taskForGETMethod(method: Methods.DailyForecast, parameters: parameters) { (result, error) in
            
            guard error == nil else {
                performOnMainQueue(updates: {
                    completionHandlerForForecast(nil, error)
                })
                return
            }
            
            if let result = result as? [String: Any], let forecastDictionary = result["list"] as? [[String: AnyObject]] {
                
                let forecast = DailyForecast.dailyForecastsFromResults(results: forecastDictionary)
                
                performOnMainQueue(updates: {
                    completionHandlerForForecast(forecast, nil)
                })
                
            } else {
                performOnMainQueue(updates: {
                    completionHandlerForForecast(nil, NSError(domain: "Forecast parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse forecast"]))
                })
            }
        }
    }
    
    func getForecastFor(cityId: Int, completionHandlerForForecast: @escaping (_ results: [DailyForecast]?, _ error: NSError?) -> Void) {
        
        let parameters: [String: String] = [
            ParameterKeys.CityId: String(cityId),
            ParameterKeys.Format: Constants.JSONFormat,
            ParameterKeys.NumberOfDays: String(14),
            ParameterKeys.Units: Constants.ImperialUnits,
            ]
        
        taskForGETMethod(method: Methods.DailyForecast, parameters: parameters) { (result, error) in
            
            guard error == nil else {
                performOnMainQueue(updates: {
                    completionHandlerForForecast(nil, error)
                })
                return
            }
            
            if let result = result as? [String: Any], let forecastDictionary = result["list"] as? [[String: AnyObject]] {
                
                let forecast = DailyForecast.dailyForecastsFromResults(results: forecastDictionary)
                
                performOnMainQueue(updates: {
                    completionHandlerForForecast(forecast, nil)
                })
                
            } else {
                performOnMainQueue(updates: {
                    completionHandlerForForecast(nil, NSError(domain: "Forecast parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse forecast"]))
                })
            }
        }
    }
    
}
