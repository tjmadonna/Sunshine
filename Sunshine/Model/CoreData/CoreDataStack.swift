//
//  CoreDataStack.swift
//  Sunshine
//
//  Created by Tyler Madonna on 2/11/17.
//  Copyright © 2017 Tyler Madonna. All rights reserved.
//

import CoreData

struct CoreDataStack {
    
    // MARK: - Properties
    let context: NSManagedObjectContext
    private let model: NSManagedObjectModel
    private let coordinator: NSPersistentStoreCoordinator
    private let modelURL: URL
    private let dbURL: URL
    
    // MARK: - Initializers
    init?() {
        
        // Assumes the model is in the main bundle
        guard let modelURL = Bundle.main.url(forResource: "Model", withExtension: "momd") else {
            print("Unable to find Model in the main bundle")
            return nil
        }
        
        self.modelURL = modelURL
        
        // Try to create the model from the URL
        guard let model = NSManagedObjectModel(contentsOf: modelURL) else {
            print("unable to create a model from \(modelURL)")
            return nil
        }
        
        self.model = model
        
        // Create the store coordinator
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        // create a context and add connect it to the coordinator
        context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        
        // Add a SQLite store located in the documents folder
        let fm = FileManager.default
        
        guard let  docUrl = fm.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Unable to reach the documents folder")
            return nil
        }
        
        self.dbURL = docUrl.appendingPathComponent("model.sqlite")
        
        do {
            try addStoreCoordinator(storeType: NSSQLiteStoreType, configuration: nil, storeURL: dbURL, options: nil)
        } catch{
            print("unable to add store at \(dbURL)")
        }
        
        print("finished creating core data")
    }
    
    // MARK: - Utils
    
    func addStoreCoordinator(storeType: String, configuration: String?, storeURL: URL, options : [NSObject : AnyObject]?) throws {
        try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: dbURL as URL, options: nil)
    }
    
    // MARK: - Removing data
    
    // CAUTION: TESTING ONLY!!!!
    // Delete all the objects in the db and leave an empty table
    func dropAllData() throws {

        try coordinator.destroyPersistentStore(at: dbURL, ofType:NSSQLiteStoreType , options: nil)
        
        try addStoreCoordinator(storeType: NSSQLiteStoreType, configuration: nil, storeURL: dbURL, options: nil)
        
    }
    
    // MARK: - Save
    
    func save() {
        
        if self.context.hasChanges{
            
            do{
                try self.context.save()
            } catch{
                fatalError("Error while saving main context: \(error)")
            }
        }
    }
    
    // MARK: - Fetch results

    func fetchLocationRequestWithName(_ ascending: Bool) -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Location");
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return request
    }

}
