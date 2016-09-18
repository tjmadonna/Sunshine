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
        static let NumberOfDays = "cnt"
        static let Units = "units"
    }
    
    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: Forecast
        
        // MARK: General
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"
        
        // MARK: Authorization
        static let RequestToken = "request_token"
        static let SessionID = "session_id"
        
        // MARK: Account
        static let UserID = "id"
        
        // MARK: Config
        static let ConfigBaseImageURL = "base_url"
        static let ConfigSecureBaseImageURL = "secure_base_url"
        static let ConfigImages = "images"
        static let ConfigPosterSizes = "poster_sizes"
        static let ConfigProfileSizes = "profile_sizes"
        
        // MARK: Movies
        static let MovieID = "id"
        static let MovieTitle = "title"
        static let MoviePosterPath = "poster_path"
        static let MovieReleaseDate = "release_date"
        static let MovieReleaseYear = "release_year"
        static let MovieResults = "results"
        
    }
}
