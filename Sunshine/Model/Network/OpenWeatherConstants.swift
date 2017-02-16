//
//  OpenWeatherConstants.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

// MARK: - OpenWeatherClient (Constants)

extension OpenWeatherClient {
    
    // MARK: Constants
    struct Constants {
        
        // MARK: API Key
        static let ApiKey = "OPEN_WEATHER_API_KEY"
        
        // MARK: URLs
        static let ApiScheme = "http"
        static let ApiHost = "api.openweathermap.org"
        static let ApiPath = "/data/2.5"
        
        // MARK: General
        static let JSONFormat = "json"
        
        // MARK: Forecast
        static let ImperialUnits = "imperial"
        static let MetricUnits = "metric"
    }
    
    // MARK: Methods
    struct Methods {
        
        // MARK: Forecast
        static let DailyForecast = "/forecast/daily"
    }
    
    // MARK: Parameter Keys
    struct ParameterKeys {
        
        // MARK: General
        static let ApiKey = "appid"
        static let Format = "mode"
        
        // MARK: Forecast
        static let CityName = "q"
        static let CityId = "id"
        static let NumberOfDays = "cnt"
        static let Units = "units"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: City
        static let CityId = "id"
        static let CityName = "name"
        
        // MARK: Forecast
        static let Date = "dt"
        static let Temperature = "temp"
        static let HighTemperature = "max"
        static let LowTemperature = "min"
        static let Pressure = "pressure"
        static let Humidity = "humidity"
        static let Weather = "weather"
        static let ConditionId = "id"
        static let ConditionDescription = "main"
        
    }
}
