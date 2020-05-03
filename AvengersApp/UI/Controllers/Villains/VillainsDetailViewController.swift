//
//  VillainsDetailViewController.swift
//  AvengersApp
//
//  Created by Fran González on 20/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class VillainsDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var barTitle: String?
    var villain: Villains?
    let datamanager = DataManager()
    private var allBattles: [Battles] = []
    private var villainBattles: [Battles] = []
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var powerStars: UIImageView!
    @IBOutlet weak var biography: UITextView!
    @IBOutlet weak var hasBattlesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = barTitle
        villainImage.image = UIImage(named: "\(villain?.image ?? "")")
        biography.text = villain?.summary
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
        updateVillainBattles()
         guard let battlesCollection = self.collectionView else { return }
        if villainHasBattles() {
            battlesCollection.isHidden = false
            hasBattlesLabel.isHidden = true
        } else {
            battlesCollection.isHidden = true
            hasBattlesLabel.isHidden = false
        }
    }
    
    private func updateVillainBattles(){
        allBattles = datamanager.loadAllBattles()
        villainBattles = allBattles.filter({ $0.villain == self.villain?.id })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateStars()
    }
    
    private func villainHasBattles() -> Bool {
        if villainBattles.isEmpty { return false } else { return true }
    }
    
    
    func updateStars() {
        switch villain!.power {
        case 1:
            powerStars.image = UIImage(named: "ic_stars_1")
        case 2:
            powerStars.image = UIImage(named: "ic_stars_2")
        case 3:
            powerStars.image = UIImage(named: "ic_stars_3")
        case 4:
            powerStars.image = UIImage(named: "ic_stars_4")
        case 5:
            powerStars.image = UIImage(named: "ic_stars_5")
        default:
            powerStars.image = UIImage(named: "ic_stars_0")
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
     if (segue.identifier == "SEGUE_FROM_VILLAIN_POWER_TO_EDITPOWER") {
            guard let destinationVC = segue.destination as? EditPowerViewController else { return }
            destinationVC.power = Double(villain!.power)
            destinationVC.villain = self.villain
            destinationVC.onCompletion = { success in
                self.updateStars()
            }
        } else if (segue.identifier == "SEGUE_FROM_VILLAIN_BATTLE_TO_BATTLE_DETAIL") {
            guard let destinationVC = segue.destination as? BattlesDetailViewController else { return }
            let cell = sender as! BattleCell
            guard let indexPaths = self.collectionView.indexPath(for: cell) else { return }
            destinationVC.battles = villainBattles
            destinationVC.battlePos = indexPaths.item
            destinationVC.onCompletion = { success in
                self.updateVillainBattles()
                self.collectionView.reloadData()
            }
        }
    }
    
    // MARK: - Edit Power delegate

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BattleCell
        if villainBattles[indexPath.row].winner == self.villain?.id {
            cell.backgroundColor = .blue
        } else {
            cell.backgroundColor = .red
        }
        
        cell.layer.cornerRadius = 20.0
        cell.battleNameLabel?.textColor = .white
        cell.battleNameLabel?.text = "Batalla \(indexPath.item + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return villainBattles.count
    }

}
