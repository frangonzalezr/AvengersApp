//
//  UIViewController+Extensions.swift
//  AvengersApp
//
//  Created by Fran González on 19/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

extension UIViewController {
    /// Muestra un alertcontroller con una única acción
    /// - Parameters:
    ///   - alertMessage: Mensaje del alert
    ///   - alertTitle: Título del alert
    ///   - alertActionTitle: Título de la acción
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = NSLocalizedString("Error", comment: ""),
                               _ alertActionTitle: String = NSLocalizedString("OK", comment: "")) {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 15

    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    
    class func randomColor() -> UIColor {

        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100

        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}
