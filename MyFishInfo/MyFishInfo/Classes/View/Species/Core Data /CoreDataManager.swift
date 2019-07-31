//
//  CoreDataManager.swift
//  CoreDataLearning
//
//  Created by Stephen Cao on 12/7/19.
//  Copyright © 2019 Stephencao Cao. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    static let shared = CoreDataManager()
    
    lazy var context: NSManagedObjectContext = {
        let context = ((UIApplication.shared.delegate) as! AppDelegate).context
        return context
    }()
    
    private func saveContext() {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func addSpeciesItemWith(name: String, item: Data) {
        let speciesItem = NSEntityDescription.insertNewObject(forEntityName: "SpeciesItem", into: context) as! SpeciesItem
        speciesItem.speciesName = name
        speciesItem.item = item
        saveContext()
        
        NotificationCenter.default.post(name: NSNotification.Name(InfoCommon.SCUpdateFavouriteSpecies), object: nil)
    }
    
    func getAllSpeciesItems() -> [SpeciesItem] {
        let fetchRequest: NSFetchRequest = SpeciesItem.fetchRequest()
        // for sort 
        let sort = NSSortDescriptor(key: #keyPath(SpeciesItem.speciesName), ascending: true)
        fetchRequest.sortDescriptors = [sort]
        do {
            let result = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    
    func getSpeciesItemWith(name: String) -> [SpeciesItem] {
        let fetchRequest: NSFetchRequest = SpeciesItem.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "speciesName == %@", name)
        do {
            let result: [SpeciesItem] = try context.fetch(fetchRequest)
            return result
        } catch {
            fatalError();
        }
    }
    
    
    func deleteWith(name: String) {
        let fetchRequest: NSFetchRequest = SpeciesItem.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "speciesName == %@", name)
        do {
            let result = try context.fetch(fetchRequest)
            for item in result {
                context.delete(item)
            }
        } catch {
            fatalError();
        }
        saveContext()
        
        NotificationCenter.default.post(name: NSNotification.Name(InfoCommon.SCUpdateFavouriteSpecies), object: nil)
    }
    
    func deleteAllSpecies() {
        let result = getAllSpeciesItems()
        for item in result {
            context.delete(item)
        }
        saveContext()
        
        NotificationCenter.default.post(name: NSNotification.Name(InfoCommon.SCUpdateFavouriteSpecies), object: nil)
    }
}
