//
//  ForecastController.swift
//  Sunshine
//
//  Created by Tyler Madonna on 9/14/16.
//  Copyright © 2016 Tyler Madonna. All rights reserved.
//

import UIKit

class ForecastController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var forecast: [DailyForecast]?
    
    let todayCellId = "todayCellId"
    
    let forecastCellId = "forecastCellId";
    
    let client = OpenWeatherClient()
    
    override func viewDidLoad() {
        collectionView!.backgroundColor = .white
        
        if let navBarHeight = navigationController?.navigationBar.frame.height {
            navigationItem.titleView = SunshineTitleView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: navBarHeight))
        }
        
        collectionView!.register(TodayForecastCell.self, forCellWithReuseIdentifier: todayCellId)
        collectionView!.register(ForecastCell.self, forCellWithReuseIdentifier: forecastCellId)
        
        refreshWeather()
    }
    
    private func refreshWeather() {
        client.getForecast { (forecast, error) in
            
            if let forecast = forecast {
                self.forecast = forecast
                self.collectionView?.reloadData()
            } else {
                self.createAlert(title: "An error occured", message: error?.userInfo[NSLocalizedDescriptionKey] as! String)
            }
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if forecast == nil {
            return 0
        } else {
            return forecast!.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellId: String
        
        switch indexPath.item {
        case 0:
            cellId = todayCellId
        default:
            cellId = forecastCellId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! BaseForecastCell
        cell.forecast = forecast?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat
        
        switch indexPath.item {
        case 0:
            height = 183
        default:
            height = 66
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedForecast = forecast?[indexPath.row] {
            let forecastDetailController = ForecastDetailViewController()
            forecastDetailController.forecast = selectedForecast
            navigationController?.pushViewController(forecastDetailController, animated: true)
        } else {
            createAlert(title: "Forecast Unavailable", message: "Unable to able to retrieve the forecast")
        }
    }
    
    // Create an alert controller to prompt user
    private func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
