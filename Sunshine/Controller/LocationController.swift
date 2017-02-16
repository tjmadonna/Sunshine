//
//  LocationController.swift
//  Sunshine
//
//  Created by Tyler Madonna on 2/11/17.
//  Copyright © 2017 Tyler Madonna. All rights reserved.
//

import UIKit
import CoreData

class LocationController: CoreDataController {
    
    let locationCellId = "locationCellId";
    
    var client: OpenWeatherClient!
    
    var coreDataStack: CoreDataStack!
    
    var selectedLocationId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsMultipleSelection = false
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        client = appDelegate?.client
        
        coreDataStack = appDelegate?.coreDataStack
        
        if let navBarHeight = navigationController?.navigationBar.frame.height {
            let titleLabel = UILabel(frame: CGRect(x: 16, y: 0, width: view.frame.width, height: navBarHeight))
            titleLabel.text = "Locations"
            titleLabel.textColor = .white
            titleLabel.font = UIFont.systemFont(ofSize: 25)
            navigationItem.titleView = titleLabel
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addLocationClicked))
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: locationCellId)
        
        if let currentLocationString = UserDefaults.standard.string(forKey: "CurrentLocation") {
            selectedLocationId = Int(currentLocationString)
        }
        
        let request = coreDataStack.fetchLocationRequestWithName(true)
        
        // Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: coreDataStack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    func addLocationClicked() {
        
        let alertController = UIAlertController(title: "Add Location", message: "Enter a city name or zip code", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "City name or zip code"
        }
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { (alertAction) in
            
            if let location = alertController.textFields?[0].text {
                
                self.client.getForecastFor(cityName: location, completionHandlerForForecast: { (city, forecasts, error) in
                    self.handleLocationRequest(city: city, error: error)
                })
                
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        navigationController?.present(alertController, animated: true)
    }
    
    private func handleLocationRequest(city: City?, error: NSError?) {
        if let city = city {
            let _ = Location(city: city, context: self.coreDataStack.context)
            self.coreDataStack.save()
        } else {
            print("\(error)")
            self.createAlert(title: "Location Unavailable", message: "Unable to able to retrieve the location")
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let location = fetchedResultsController?.object(at: indexPath) as? Location
        
        let cell = tableView.dequeueReusableCell(withIdentifier: locationCellId, for: indexPath)
        
        cell.textLabel?.text = location?.name
        
        cell.accessoryType = accessoryTypeForRowAt(location)
        
        return cell
        
    }
    
    private func accessoryTypeForRowAt(_ location: Location?) -> UITableViewCellAccessoryType {
        guard let id = location?.id else {
            return .none
        }
        
        return Int(id) == selectedLocationId ? UITableViewCellAccessoryType.checkmark : .none
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.reloadData()
        
        let location = fetchedResultsController?.object(at: indexPath) as? Location
        
        UserDefaults.standard.set(location?.id, forKey: "CurrentLocation")
        
        navigationController?.dismiss(animated: true)
    }
    
    // Message displayed on tableview background when tableview is empty
    override func messageForEmptyTableView() -> String {
        return "No Locations Found"
    }
    
    // Create an alert controller to prompt user
    
    private func createAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        navigationController?.present(alertController, animated: true, completion: nil)
    }
    
}
