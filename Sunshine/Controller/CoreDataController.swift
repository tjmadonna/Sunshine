//
//  CoreDataController.swift
//  Sunshine
//
//  Created by Tyler Madonna on 2/11/17.
//  Copyright © 2017 Tyler Madonna. All rights reserved.
//

import UIKit
import CoreData

class CoreDataController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    // MARK:  - Properties
    var fetchedResultsController : NSFetchedResultsController<NSFetchRequestResult>? {
        didSet{
            // Whenever the fetchedResultsController changes, we execute the search and reload the table
            fetchedResultsController?.delegate = self
            executeSearch()
            tableView.reloadData()
        }
    }
    
    // MARK: - Subclass override methods
    
    // Create the table view cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("cellForRowAtIndexPath MUST be implemented by a subclass of CoreDataTableViewController")
    }
    
    // Message displayed on tableview background when tableview is empty
    func messageForEmptyTableView() -> String {
        fatalError("messageForEmptyTableView MUST be implemented by a subclass of CoreDataTableViewController")
    }
    
    // MARK: - Table Data Source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sectionCount = fetchedResultsController?.sections?.count {
            return sectionCount
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowCount = fetchedResultsController?.sections![section].numberOfObjects {
            if rowCount == 0 {
                self.tableView.backgroundView = EmptyTableViewLabel(message: messageForEmptyTableView(), size: CGSize(width: tableView.frame.width, height: tableView.frame.height))
            } else {
                self.tableView.backgroundView = nil
            }
            return rowCount;
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fetchedResultsController?.sections?[section].name;
    }

    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let fc = fetchedResultsController{
            return fc.section(forSectionIndexTitle: title, at: index)
        } else {
            return 0
        }
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return fetchedResultsController?.sectionIndexTitles
    }
    
    // MARK: - Fetches

    func executeSearch(){
        if let fc = fetchedResultsController {
            do{
                try fc.performFetch()
            }catch let e as NSError{
                print("Error while trying to perform a search: \n\(e)\n\(fetchedResultsController)")
            }
        }
    }
    
    // MARK: - Delegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        
        let set = IndexSet(integer: sectionIndex)
        
        switch (type){
            
        case .insert:
            tableView.insertSections(set, with: .fade)
            
        case .delete:
            tableView.deleteSections(set, with: .fade)
            
        default:
            // irrelevant in our case
            break
            
        }
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
            
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
            
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
            
        case .update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
            
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .fade)
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}



