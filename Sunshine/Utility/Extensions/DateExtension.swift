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
    
}
