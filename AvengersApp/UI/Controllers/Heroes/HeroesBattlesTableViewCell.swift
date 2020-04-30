//
//  HeroesBattlesTableViewCell.swift
//  AvengersApp
//
//  Created by Fran González on 26/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class HeroesBattlesTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    @IBOutlet weak var collectionView: UICollectionView?
    let battlesData = ["Batalla 1", "Batalla 2", "Batalla 3", "Batalla 4", "Batalla 5"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return battlesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BattleCell
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 20.0
        cell.battleNameLabel?.text = battlesData[indexPath.item]
        return cell
    }
    
}
