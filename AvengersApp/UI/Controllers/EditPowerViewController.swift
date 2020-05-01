//
//  EditPowerViewController.swift
//  AvengersApp
//
//  Created by Fran González on 01/05/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class EditPowerViewController: UIViewController {
    
    @IBOutlet weak var star1Button: UIButton!
    @IBAction func changePower(_ sender: UIButton) {
        let image = sender.currentImage
        print("PULSAMOS LA ESTRELLA \(sender.restorationIdentifier ?? "") CON IMAGEN \(String(describing: image))")
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .black, scale: .large)
        if image == UIImage(systemName: "star", withConfiguration: largeConfig) {
            sender.setImage(UIImage(systemName: "star.fill", withConfiguration: largeConfig), for: .normal)
        } else {
            sender.setImage(UIImage(systemName: "star", withConfiguration: largeConfig), for: .normal)
        }
        
    }
    
    @IBAction func cancelEditPower(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveEditPower(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
