//
//  TodayForecastCell.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/14/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class TodayForecastCell: BaseForecastCell {
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .sunshineBlue
        
        let spacerView = UIView()
        addSubview(spacerView)

        addConstraintsWithFormat("H:|-16-[v0]-16-|", views: dateLabel)
        addConstraintsWithFormat("H:|-74-[v0(98)]-[v1]-[v2(90)]-16-|", views: highTempLabel, spacerView, forecastImage)
        addConstraintsWithFormat("H:|-74-[v0(98)]-[v1]-[v2(90)]-16-|", views: lowTempLabel, spacerView, forecastLabel)
        addConstraintsWithFormat("V:|-16-[v0(35)]-8-[v1(65)]-8-[v2(35)]", views: dateLabel, highTempLabel, lowTempLabel)
        addConstraintsWithFormat("V:[v0]-0-[v1(90)]-0-[v2(26)]", views:dateLabel, forecastImage, forecastLabel)
    }
    
    override func textColor() -> UIColor {
        return .white
    }
    
    override func dateFontSize() -> CGFloat {
        return 25
    }
    
    override func highTempFontSize() -> CGFloat {
        return 50
    }
    
    override func lowTempFontSize() -> CGFloat {
        return 25
    }
    
    override func forecastFontSize() -> CGFloat {
        return 15
    }
    
    override func tempTextAlignment() -> NSTextAlignment {
        return .left
    }
    
    override func forecastTextAlignment() -> NSTextAlignment {
        return .center
    }
    
}
