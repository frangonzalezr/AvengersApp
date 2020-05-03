//
//  BattlesTableViewCell.swift
//  AvengersApp
//
//  Created by Fran González on 24/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class BattlesTableViewCell: UITableViewCell{
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var heroBattleImage: UIImageView!
    @IBOutlet weak var villainBattleImage: UIImageView!
    @IBOutlet weak var roudBattleImage: UIImageView!
    @IBOutlet weak var heroBar: UIView!
    @IBOutlet weak var villainBar: UIView!
    
    override func awakeFromNib() {
        heroBar.layer.cornerRadius = 5.0
        villainBar.layer.cornerRadius = 5.0
        
    }
    
}
