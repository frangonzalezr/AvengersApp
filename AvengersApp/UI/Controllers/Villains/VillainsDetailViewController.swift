//
//  VillainsDetailViewController.swift
//  AvengersApp
//
//  Created by Fran González on 20/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class VillainsDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let model = generateRandomData()
    var barTitle: String?
    var villain: Villains?
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var powerStars: UIImageView!
    @IBOutlet weak var biography: UITextView!
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let battlesData = ["Batalla 1", "Batalla 2", "Batalla 3", "Batalla 4", "Batalla 5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = barTitle
        villainImage.image = UIImage(named: "\(villain?.image ?? "")")
        biography.text = villain?.summary
        switch villain?.power {
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         if (segue.identifier == "SEGUE_FROM_VILLAIN_POWER_TO_EDITPOWER") {
                guard let destinationVC = segue.destination as? EditPowerViewController else { return }
                destinationVC.power = Double(villain!.power)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BattleCell
        cell.backgroundColor = .red
        cell.layer.cornerRadius = 20.0
        cell.battleNameLabel?.text = battlesData[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return battlesData.count
    }

}
