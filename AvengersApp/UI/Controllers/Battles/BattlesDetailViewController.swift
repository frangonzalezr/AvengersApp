//
//  BattlesDetailViewController.swift
//  AvengersApp
//
//  Created by Fran González on 20/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class BattlesDetailViewController: UIViewController {
    var onCompletion: ((_ success: Bool) -> ())?
    let datamanager = DataManager()
    var barTitle: String?
    var battles: [Battles] = []
    private var heroes: [Heroes] = []
    private var villains: [Villains] = []
    
    var battlePos: Int = 0
    var hero: Int16?
    var villain: Int16?
    var winner: Int16?
    
    @IBOutlet weak var battleHeroImage: UIImageView!
    @IBOutlet weak var battleVillainImage: UIImageView!
    @IBOutlet weak var deleteBattleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = barTitle
        configureImages(image: battleHeroImage)
        configureImages(image: battleVillainImage)
        hero = battles[battlePos].hero
        villain = battles[battlePos].villain
        winner = battles[battlePos].winner
        setBorderColors()
        heroes = datamanager.loadAllHeroes()
        villains = datamanager.loadAllVillains()
        let heroForImage = heroes.filter({ $0.id == self.hero })
        battleHeroImage.image = UIImage(named: heroForImage[0].image ?? "")
        let villainForImage = villains.filter({ $0.id == self.villain })
        battleVillainImage.image = UIImage(named: villainForImage[0].image ?? "")

    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func setBorderColors(){
        if isHeroWinner() {
            battleHeroImage.layer.borderColor = UIColor.blue.cgColor
            battleVillainImage.layer.borderColor = UIColor.red.cgColor
        } else {
            battleHeroImage.layer.borderColor = UIColor.red.cgColor
            battleVillainImage.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    func isHeroWinner() -> Bool {
        if (self.hero == self.winner) {
            return true
        } else {
            return false
        }
    }
    
    func configureImages(image: UIImageView) {
        image.layer.borderWidth = 5
        image.layer.cornerRadius = 5
    }
    
    @IBAction func deleteBattle(_ sender: Any) {
        self.datamanager.deleteBattle(self.battles[battlePos])
        onCompletion?(true)
        dismiss(animated: true, completion: nil)
    }
    
}
