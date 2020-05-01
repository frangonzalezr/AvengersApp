//
//  Database.swift
//  AvengersApp
//
//  Created by Fran González on 28/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit
import CoreData

class Database {
            // MARK: - Properties
    private let entityHeroes = "Heroes"
    private let entityVillains = "Villains"
    private let entityBattles = "Battles"
    
    
            // MARK: - Managed Object Context
    
    func context() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
         
        return appDelegate.persistentContainer.viewContext
    }
    
            // MARK: - Database methods
    
    func createDataHeroes() -> NSManagedObject? {
        guard let contextAvengers = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityHeroes,
                                                      in: contextAvengers) else {
            return nil
        }
        
        return Heroes(entity: entity,
                    insertInto: context())
    }
    
    func createDataVillains() -> NSManagedObject? {
        guard let contextAvengers = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityVillains,
                                                      in: contextAvengers) else {
            return nil
        }
        
        return Villains(entity: entity,
                    insertInto: context())
    }
    
    func persistHeroes(_ heroes: Heroes) {
        guard let contextAvengers = context() else {
            return
        }
        
        try? contextAvengers.save()
    }
    
    func persistVillains(_ villains: Villains) {
        guard let contextAvengers = context() else {
            return
        }
        
        try? contextAvengers.save()
    }
    
    func fecthAllDataHeroes() -> [NSManagedObject]? {
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entityHeroes)) as? [NSManagedObject]
    }
    
    func fecthAllDataVillains() -> [NSManagedObject]? {
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entityVillains)) as? [NSManagedObject]
    }
}
