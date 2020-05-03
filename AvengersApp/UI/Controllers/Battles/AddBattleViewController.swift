//
//  AddBattleViewController.swift
//  AvengersApp
//
//  Created by Fran González on 01/05/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class AddBattleViewController: UIViewController {
    var onCompletion: ((_ success: Bool) -> ())?
    @IBOutlet weak var plusButtonVillain: UIButton!
    @IBOutlet weak var plusButtonHero: UIButton!
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    var hero = Heroes()
    var villain = Villains()
    let datamanager = DataManager()
    var heroPresent: Bool = false
    var villainPresent: Bool = false
    
    override func viewDidLoad() {
        saveButton.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         if (segue.identifier == "SEGUE_FROM_ADD_BATTLE_TO_HEROES") {
                guard let destinationVC = segue.destination as? HeroesPickerTableViewController else { return }
                destinationVC.onCompletion = { success, hero in
                    self.heroImage.alpha = 1.0
                    self.hero = hero
                    self.heroImage.image = UIImage(named: self.hero.image ?? "")
                    self.plusButtonHero.tintColor = UIColor(hexString: "#9EFF8A")
                    self.plusButtonHero.setImage(UIImage(systemName: "repeat"), for: .normal)
                    self.heroPresent = true
                    if self.villainPresent { self.saveButton.isHidden = false }
                }
        } else if (segue.identifier == "SEGUE_FROM_ADD_BATTLE_TO_VILLAINS") {
                guard let destinationVC = segue.destination as? VillainsPickerTableViewController else { return }
                destinationVC.onCompletion = { success, villain in
                    self.villainImage.alpha = 1.0
                    self.villain = villain
                    self.villainImage.image = UIImage(named: self.villain.image ?? "")
                    self.plusButtonVillain.tintColor = UIColor(hexString: "#9EFF8A")
                    self.plusButtonVillain.setImage(UIImage(systemName: "repeat"), for: .normal)
                    self.villainPresent = true
                    if self.heroPresent { self.saveButton.isHidden = false }
                }
        }
        
    }

    func isTheHeroWinner(hero: Heroes, villain: Villains) -> Bool {
        if self.hero.power > self.villain.power {
            return true
        } else if self.hero.power == self.villain.power {
            if self.hero.name?.count ?? 0 > self.villain.name?.count ?? 0 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }

    @IBAction func saveBattle(_ sender: Any) {
        guard let battle = datamanager.createBattle() else { return }
        if isTheHeroWinner(hero: self.hero , villain: self.villain) {
            battle.winner = self.hero.id
        } else {
            battle.winner = self.villain.id
        }
        battle.hero = self.hero.id
        battle.villain = self.villain.id
        datamanager.saveBattle(battle)
        onCompletion?(true)
        dismiss(animated: true, completion: nil)
    }
}






