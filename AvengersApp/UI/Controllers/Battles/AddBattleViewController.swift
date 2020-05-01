//
//  AddBattleViewController.swift
//  AvengersApp
//
//  Created by Fran González on 01/05/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class AddBattleViewController: UIViewController {
    
    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var villainImage: UIImageView!
    var hero: Heroes?
    var villain: Villains?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         if (segue.identifier == "SEGUE_FROM_ADD_BATTLE_TO_HEROES") {
                guard let destinationVC = segue.destination as? HeroesPickerTableViewController else { return }
                destinationVC.onCompletion = { success, hero in
                    self.heroImage.alpha = 1.0
                    self.hero = hero
                    self.heroImage.image = UIImage(named: self.hero?.image ?? "")
                }
        } else if (segue.identifier == "SEGUE_FROM_ADD_BATTLE_TO_VILLAINS") {
                guard let destinationVC = segue.destination as? VillainsPickerTableViewController else { return }
                destinationVC.onCompletion = { success, villain in
                    self.villainImage.alpha = 1.0
                    self.villain = villain
                    self.villainImage.image = UIImage(named: self.villain?.image ?? "")
                }
        }
        
    }

    @IBAction func saveBattle(_ sender: Any) {
        print("SALVAMOS BATALLA")
    }
    
    
}






