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
    @IBOutlet weak var blueBar: UIView!
    @IBOutlet weak var redBar: UIView!
    
    override func awakeFromNib() {
        blueBar.layer.cornerRadius = 5.0
        redBar.layer.cornerRadius = 5.0
        
    }
    
}
