//
//  WeatherUtility.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import Foundation

class WeatherUtility {
    
    static func imageIconResourceName(forWeatherId id: Int) -> String? {
        
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
    
    static func imageArtResourceName(forWeatherId id: Int) -> String? {
        if let resoureName = imageIconResourceName(forWeatherId: id) {
            return resoureName.appending("Art")
        }
        
        return nil
    }
    
    static func formatString(forDate date: Date) -> String {
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
    
    static func formatWeekdayString(forDate date: Date) -> String {
        if date.isToday() {
            return "Today"
        } else if date.isTomorrow() {
            return "Tomorrow"
        } else {
            return DateFormatter(sunshineStyle: .Weekday).string(from: date)
        }
    }
    
    static func formatWindString(forSpeed speed: Double, direction: Double) -> String {
        
        var directionString: String
        
        if (direction >= 337.5 || direction < 22.5) {
            directionString = "N";
        } else if (direction >= 22.5 && direction < 67.5) {
            directionString = "NE";
        } else if (direction >= 67.5 && direction < 112.5) {
            directionString = "E";
        } else if (direction >= 112.5 && direction < 157.5) {
            directionString = "SE";
        } else if (direction >= 157.5 && direction < 202.5) {
            directionString = "S";
        } else if (direction >= 202.5 && direction < 247.5) {
            directionString = "SW";
        } else if (direction >= 247.5 && direction < 292.5) {
            directionString = "W";
        } else if (direction >= 292.5 && direction < 337.5) {
            directionString = "NW";
        } else {
            directionString = ""
        }
        
        return String(format: "%.0lf mph %@", speed, directionString)
    }
}
