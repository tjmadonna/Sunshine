//
//  WeatherUtility.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import Foundation

class WeatherUtility {
    
    static func imageResourceName(forWeatherId id: Int) -> String? {
        
        switch id {
        case 200...232:
            return "Storm"
        case 300...321:
            return "LightRain"
        case 500...504:
            return "Rain"
        case 511:
            return "Snow"
        case 520...531:
            return "Rain"
        case 600...622:
            return "Snow"
        case 701...761:
            return "Fog"
        case 761...781:
            return "Storm"
        case 800:
            return "Clear"
        case 801:
            return "LightClouds"
        case 802...804:
            return "Clouds"
        default:
            return nil
        }
    }
    
    static func formatString(forData date: Date) -> String {
        if date.isToday() {
            return "Today, \(DateFormatter(sunshineStyle: .MonthAndDay).string(from: date))"
        } else if date.isTomorrow() {
            return "Tomorrow"
        } else if date.isThisWeek(){
            return DateFormatter(sunshineStyle: .Weekday).string(from: date)
        } else {
            return DateFormatter(sunshineStyle: .MonthAndDay).string(from: date)
        }
    }
    
}
