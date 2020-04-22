//
//  MainTabBarController.swift
//  AvengersApp
//
//  Created by Fran González on 22/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        // In Mac OS version this is not working by now due to SandBox restrictions (me queda buscar como resolver esto en los entitlements)
    self.selectedIndex = UserDefaults.standard.integer(forKey: "TAB_BAR_SELECTED")

    }
    override func viewDidDisappear(_ animated: Bool) {
        UserDefaults.standard.set(self.selectedIndex, forKey: "TAB_BAR_SELECTED")
    }
    
}
