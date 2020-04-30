//
//  BattleCell.swift
//  AvengersApp
//
//  Created by Fran González on 26/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class BattleCell: UICollectionViewCell {
    @IBOutlet weak var battleNameLabel: UILabel?

    @IBOutlet weak var cellview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCellView()
    }
    
    private func configureCellView() {
        configureViewShadow()
    }
    // Add a ligth shadow effect to the background cell view
    private func configureViewShadow() {
        cellview.layer.shadowColor = UIColor.gray.cgColor
        cellview.layer.shadowOffset = CGSize.zero
        cellview.layer.shadowRadius = 4.0
        cellview.layer.shadowOpacity = 0.2
    }

}
