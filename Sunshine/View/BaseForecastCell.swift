//
//  BaseForecastCell.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/16/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class BaseForecastCell: UICollectionViewCell {

    var forecast: DailyForecast? {
        
        didSet {
            
            if let date = forecast?.date {
                dateLabel.text = WeatherUtility.formatString(forDate: date)
            }
            
            if let highTemp = forecast?.highTemp {
                highTempLabel.text = "\(Int(highTemp))°"
            }
            
            if let lowTemp = forecast?.lowTemp {
                lowTempLabel.text = "\(Int(lowTemp))°"
            }
            
            if let forecastId = forecast?.conditionId, let imageString = WeatherUtility.imageIconResourceName(forWeatherId: forecastId) {
                forecastImage.image = UIImage(named: imageString)
            }
            
            if let forecastString = forecast?.conditionDescription {
                forecastLabel.text = "\(forecastString)"
            }
        }
    }
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor()
        label.text = "Pittsburgh"
        label.font = UIFont.systemFont(ofSize: self.dateFontSize())
        return label
    }()

    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor()
        label.text = "September 31"
        label.font = UIFont.systemFont(ofSize: self.dateFontSize())
        return label
    }()
    
    lazy var highTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor()
        label.text = "97°"
        label.font = UIFont.systemFont(ofSize: self.highTempFontSize())
        label.textAlignment = self.tempTextAlignment()
        return label
    }()
    
    lazy var lowTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor()
        label.font = UIFont.systemFont(ofSize: self.lowTempFontSize())
        label.text = "73°"
        label.textAlignment = self.tempTextAlignment()
        return label
    }()
    
    let forecastImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "clear")
        return imageView
    }()
    
    lazy var forecastLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor()
        label.text = "Clear"
        label.textAlignment = self.forecastTextAlignment()
        label.font = UIFont.systemFont(ofSize: self.forecastFontSize())
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        addSubview(dateLabel)
        addSubview(highTempLabel)
        addSubview(lowTempLabel)
        addSubview(forecastImage)
        addSubview(forecastLabel)
    }
    
    func textColor() -> UIColor {
        return .black
    }
    
    func dateFontSize() -> CGFloat {
        return 18
    }
    
    func highTempFontSize() -> CGFloat {
        return 18
    }
    
    func lowTempFontSize() -> CGFloat {
        return 15
    }
    
    func forecastFontSize() -> CGFloat {
        return 15
    }
    
    func tempTextAlignment() -> NSTextAlignment {
        return .center
    }
    
    func forecastTextAlignment() -> NSTextAlignment {
        return .left
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
