//
//  DataManager.swift
//  AvengersApp
//
//  Created by Fran González on 22/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class DataManager {
    private var database: Database? = nil
    var heroesJSON: [Character] = []
    var villainsJSON: [Character] = []
    

    
    init() {
        database = Database()
    }
    
    deinit {
        database = nil
    }
        
    func createHero() -> Heroes? {
        return database?.createDataHeroes() as? Heroes
    }
    
    func createVillain() -> Villains? {
        return database?.createDataVillains() as? Villains
    }
    
    func saveHero(_ heroes: Heroes) {
        database?.persistHeroes(heroes)
    }
    
    func saveVillain(_ villains: Villains) {
         database?.persistVillains(villains)
     }
    
    func loadAllHeroes() -> [Heroes] {
        guard let data = database?.fecthAllDataHeroes() as? [Heroes] else {
            return []
        }
        
        return data
    }
    
    func loadAllVillains() -> [Villains] {
        guard let data = database?.fecthAllDataVillains() as? [Villains] else {
            return []
        }
        
        return data
    }
    func loadInitialData() {
        if let pathURLHeroes = Bundle.main.url(forResource: "heroes", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURLHeroes)
                let decoder = JSONDecoder()
                    heroesJSON = try decoder.decode([Character].self, from: data)
            } catch {
                fatalError("Could not read the JSON")
            }
        } else {
            fatalError("Could not build the path url")
        }
        
        if let pathURLVillains = Bundle.main.url(forResource: "villains", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURLVillains)
                let decoder = JSONDecoder()
                    villainsJSON = try decoder.decode([Character].self, from: data)
            } catch {
                fatalError("Could not read the JSON")
            }
        } else {
            fatalError("Could not build the path url")
        }
        
                for hero in heroesJSON {
                    let heroCD = createHero()
                    heroCD?.id = hero.id
                    heroCD?.name = hero.name
                    heroCD?.image = hero.image
                    heroCD?.power = hero.power
                    heroCD?.summary = hero.summary
                }
        
                for villain in villainsJSON {
                    let villainCD = createVillain()
                    villainCD?.id = villain.id
                    villainCD?.name = villain.name
                    villainCD?.image = villain.image
                    villainCD?.power = villain.power
                    villainCD?.summary = villain.summary
                }
        try? database?.context()?.save()

    }
}
