//
//  EditPowerViewController.swift
//  AvengersApp
//
//  Created by Fran González on 01/05/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit


class EditPowerViewController: UIViewController {
    var onCompletion: ((_ success: Bool) -> ())?
    @IBOutlet weak var floatRatingView: FloatRatingView!
    var power: Double?
    var hero: Heroes?
    var villain: Villains?
    let datamanager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        floatRatingView.backgroundColor = UIColor.clear
        floatRatingView.delegate = self
        floatRatingView.contentMode = UIView.ContentMode.scaleAspectFit
        floatRatingView.type = .wholeRatings
        floatRatingView.rating = power ?? 2.5
        
    }
    
    @IBAction func cancelEditPower(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveEditPower(_ sender: UIButton) {
        if villain == nil {
            self.hero?.power = Int16(self.power ?? 2.5)
            datamanager.saveHero(self.hero!)
        } else {
            self.villain?.power = Int16(self.power ?? 2.5)
            datamanager.saveVillain(self.villain!)
        }
        onCompletion?(true)
        dismiss(animated: true, completion: nil)
    }
}
extension EditPowerViewController: FloatRatingViewDelegate {

    // MARK: FloatRatingViewDelegate
    
    func floatRatingView(_ ratingView: FloatRatingView, isUpdating rating: Double) {
        self.power = self.floatRatingView.rating
        print("Live Rating: \(self.power ?? 2.5)")
    }
    
    func floatRatingView(_ ratingView: FloatRatingView, didUpdate rating: Double) {
        self.power = self.floatRatingView.rating
        print("Updated Rating: \(self.power ?? 2.5)")
    }
    
}
