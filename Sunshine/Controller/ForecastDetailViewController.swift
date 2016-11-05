//
//  ForecastDetailViewController.swift
//  Sunshine
//
//  Created by Tyler Madonna on 11/4/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class ForecastDetailViewController: UIViewController {

    var forecast: DailyForecast?
    
    override func loadView() {
        self.view = ForecastDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let detailView = self.view as? ForecastDetailView {
            detailView.forecast = forecast
        }
        
    }
    
}
