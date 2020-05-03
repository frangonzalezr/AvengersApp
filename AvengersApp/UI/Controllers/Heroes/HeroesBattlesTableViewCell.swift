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
    
    let datamanager = DataManager()
    var heroId: Int16? {
        didSet{
            refreshContent()
        }
    }
    
    // MARK: Private methods
    
    private var allBattles: [Battles] = []
    private var heroBattles: [Battles] = []
    
    private func refreshContent() {
        loadAllContent()
        showData()
    }
    
    private func loadAllContent() {
        allBattles = datamanager.loadAllBattles()
        heroBattles = allBattles.filter({ $0.hero == heroId })
     }
    
    private func showData() {
        collectionView?.reloadData()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = UIColor(hexString: "#a3bce6")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroBattles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BattleCell
        if heroBattles[indexPath.row].winner == heroId {
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .red
        }
        
        cell.layer.cornerRadius = 20.0
        cell.battleNameLabel?.textColor = .white
        cell.battleNameLabel?.text = "Batalla \(indexPath.row + 1)"
        return cell
    }
    
}
