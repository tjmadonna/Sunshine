//
//  ForecastCell.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class ForecastCell: BaseForecastCell {
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        forecastImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        forecastImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addConstraintsWithFormat("H:|-16-[v0(50)]-[v1]-[v2(88)]-16-|", views: forecastImage, dateLabel, highTempLabel)
        addConstraintsWithFormat("H:[v0]-[v1]-[v2(88)]-16-|", views: forecastImage, forecastLabel, lowTempLabel)
        addConstraintsWithFormat("V:|-8-[v0(21)]-[v1(21)]", views: dateLabel, forecastLabel)
        addConstraintsWithFormat("V:|-8-[v0(21)]-[v1(21)]", views: highTempLabel, lowTempLabel)
    }
}
