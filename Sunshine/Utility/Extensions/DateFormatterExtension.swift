//
//  DateFormatterExtension.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/18/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

extension DateFormatter {
    
    enum SunshineStyle: String {
        case MonthAndDay = "MMMM d"
        case Weekday = "EEEE"
    }
    
    convenience init(sunshineStyle: DateFormatter.SunshineStyle) {
        self.init()
        self.dateFormat = sunshineStyle.rawValue
    }
    
}
