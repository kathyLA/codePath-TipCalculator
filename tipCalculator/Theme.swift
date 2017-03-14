//
//  Theme.swift
//  tipCalculator
//
//  Created by kathy yin on 3/13/17.
//  Copyright © 2017 kathy. All rights reserved.
//

import Foundation
import UIKit
class Theme {
    static let teal500: UIColor = UIColor(hex:"009688")
    static let defaultTextColor =   UIColor.white
    static let defaultBackgroundColor = teal500
    static let globalTintColor = lightBlue900
    static let teal700 =  UIColor(hex: "00796B")
    static let teal900 =  UIColor(hex: "004D40")
    static let lightBlue900 = UIColor(hex: "01579B")
    static let blue500 = UIColor(hex: "2196F3")
    static let brown500 = UIColor(hex: "795548")
    static let orange800 = UIColor(hex: "EF6C00")
    static let blue900 = UIColor(hex: "0D47A1")
    static let blueA200 = UIColor(hex: "448AFF")
    static let blueA400 = UIColor(hex: "2979FF")
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
