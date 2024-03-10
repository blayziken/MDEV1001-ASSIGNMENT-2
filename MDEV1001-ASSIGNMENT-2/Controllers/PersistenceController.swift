//
//  PersistenceController.swift
//  MDEV1001-ASSIGNMENT-2
//
//  Created by Blaze on 10/03/2024.
//

import Foundation
import CoreData
import UIKit

//struct ItemData: Codable, Hashable, Identifiable{
//    let id: String
//    let name: String
//}

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MovieModel")
        container.loadPersistentStores{ (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
                
            }
        }
    }
}


//
//class DataImporter {
//    func preloadData() {
//        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
//            print("JSON file not found.")
//            return
//        }
//
//        do {
//            let data = try Data(contentsOf: url)
//            let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] ?? []
//            
//            for item in json {
//                saveToCoreData(item)
//            }
//        } catch {
//            print("Error parsing JSON: \(error)")
//        }
//    }
//    
//    func saveToCoreData(_ item: [String: Any]) {
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        let context = appDelegate.persistentContainer.viewContext
//        let entity = NSEntityDescription.entity(forEntityName: "MovieItem", in: context)!
//        let object = NSManagedObject(entity: entity, insertInto: context)
//        
//        // Map item to Core Data attributes
//        object.setValue(item["attribute1"], forKeyPath: "attribute1")
//        object.setValue(item["attribute2"], forKeyPath: "attribute2")
//        // Set other attributes...
//
//        do {
//            try context.save()
//        } catch let error as NSError {
//            print("Could not save. \(error), \(error.userInfo)")
//        }
//    }
//}
//
