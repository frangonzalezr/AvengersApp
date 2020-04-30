//
//  Character.swift
//  AvengersApp
//
//  Created by Fran González on 28/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import Foundation

class Character: Identifiable, Codable, Equatable, CustomStringConvertible {

    var description: String {
        return "\(id), \(name ?? ""), \(image ?? ""), \(power), \(summary ?? "")"
    }
    
    var id: Int16
    var name: String?
    var image: String?
    var power: Int16
    var summary: String?
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.image == rhs.image &&
        lhs.power == rhs.power &&
        lhs.summary == rhs.summary
    }
}
