//
//  DateExtension.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/18/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

extension Date {
    
    init(timeIntervalSince1970: Int) {
        let timeInterval = TimeInterval(integerLiteral: Int64(timeIntervalSince1970))
        self.init(timeIntervalSince1970: timeInterval)
    }
    
    func isToday() -> Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    func isTomorrow() -> Bool {
        return Calendar.current.isDateInTomorrow(self)
    }
    
    func isThisWeek() -> Bool {
        let today = Date()
        let thisWeek = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: today)
        
        return self.compare(today) == .orderedDescending && self.compare(thisWeek!) == .orderedAscending
    }
    
}
