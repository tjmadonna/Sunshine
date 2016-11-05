//
//  ForecastDetailView.swift
//  Sunshine
//
//  Created by Tyler Madonna on 11/4/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class ForecastDetailView: UIView {

    var forecast: DailyForecast? {
        didSet {
            
            if let date = forecast?.date {
                weekdayLabel.text = WeatherUtility.formatWeekdayString(forDate: date)
                dateLabel.text = DateFormatter(sunshineStyle: .MonthAndDay).string(from: date)
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
            
            if let humidity = forecast?.humidity {
                humidityLabel.text = "Humidity: \(humidity)%"
            }
            
            if let pressure = forecast?.pressure {
                pressureLabel.text = "Pressure: \(pressure) hPa"
            }
            
        }
    }
    
    let weekdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    let highTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 85)
        label.textAlignment = .center
        return label
    }()
    
    let lowTempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 45)
        label.textAlignment = .center
        return label
    }()
    
    let forecastImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let forecastLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let pressureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setupViews()
    }
    
    private func setupViews() {
        
        let topContainer = setupTopContainer()
        
        self.addSubview(highTempLabel)
        self.addSubview(lowTempLabel)
        self.addSubview(forecastImage)
        self.addSubview(forecastLabel)
        self.addSubview(humidityLabel)
        self.addSubview(pressureLabel)
        
        // ForecastImage image constraints
        forecastImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        forecastImage.topAnchor.constraint(equalTo: topContainer.bottomAnchor, constant: 8).isActive = true
        forecastImage.widthAnchor.constraint(equalToConstant: 114).isActive = true
        forecastImage.heightAnchor.constraint(equalToConstant: 114).isActive = true
        
        // ForecastLabel label constraints
        forecastLabel.rightAnchor.constraint(equalTo: forecastImage.rightAnchor).isActive = true
        forecastLabel.topAnchor.constraint(equalTo: forecastImage.bottomAnchor, constant: 8).isActive = true
        forecastLabel.widthAnchor.constraint(equalTo: forecastImage.widthAnchor).isActive = true
        forecastLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        // HighTempLabel label constraints
        highTempLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        highTempLabel.topAnchor.constraint(equalTo: forecastImage.topAnchor).isActive = true
        highTempLabel.rightAnchor.constraint(equalTo: forecastImage.leftAnchor, constant: -8).isActive = true
        highTempLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // LowTempLabel label constraints
        lowTempLabel.leftAnchor.constraint(equalTo: highTempLabel.leftAnchor).isActive = true
        lowTempLabel.topAnchor.constraint(equalTo: highTempLabel.bottomAnchor, constant: 8).isActive = true
        lowTempLabel.rightAnchor.constraint(equalTo: highTempLabel.rightAnchor).isActive = true
        lowTempLabel.bottomAnchor.constraint(equalTo: forecastLabel.bottomAnchor).isActive = true
        
        // HumidityLabel label constraints
        humidityLabel.leftAnchor.constraint(equalTo: highTempLabel.leftAnchor).isActive = true
        humidityLabel.topAnchor.constraint(equalTo: lowTempLabel.bottomAnchor, constant: 16).isActive = true
        humidityLabel.rightAnchor.constraint(equalTo: forecastImage.rightAnchor).isActive = true
        humidityLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // PressureLabel label constraints
        pressureLabel.leftAnchor.constraint(equalTo: highTempLabel.leftAnchor).isActive = true
        pressureLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 8).isActive = true
        pressureLabel.rightAnchor.constraint(equalTo: forecastImage.rightAnchor).isActive = true
        pressureLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
    
    private func setupTopContainer() -> UIView {
        let topContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .sunshineBlue
            return view
        }()
        
        self.addSubview(topContainer)
        
        // TopContainer constraints
        topContainer.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        topContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topContainer.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        topContainer.heightAnchor.constraint(equalToConstant: 82).isActive = true
        
        topContainer.addSubview(weekdayLabel)
        topContainer.addSubview(dateLabel)
        
        // Weekday label constraints
        weekdayLabel.leftAnchor.constraint(equalTo: topContainer.leftAnchor, constant: 16).isActive = true
        weekdayLabel.topAnchor.constraint(equalTo: topContainer.topAnchor, constant: 16).isActive = true
        weekdayLabel.rightAnchor.constraint(equalTo: topContainer.rightAnchor, constant: -16).isActive = true
        weekdayLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // DateLabel label constraints
        dateLabel.leftAnchor.constraint(equalTo: weekdayLabel.leftAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: weekdayLabel.bottomAnchor, constant: 8).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: weekdayLabel.rightAnchor).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        return topContainer
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
