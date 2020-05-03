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
    
    var battlePos: Int = 0
    
    
    @IBOutlet weak var deleteBattleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = barTitle
    }
    
    @IBAction func deleteBattle(_ sender: Any) {
        self.datamanager.deleteBattle(self.battles[battlePos])
        onCompletion?(true)
        dismiss(animated: true, completion: nil)
    }
    
}
