//
//  UIColor+Extensions.swift
//  CurlDemo
//
//  Created by HIROKI IKEUCHI on 2022/02/24.
//

import UIKit

extension UIColor {
        
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1)
    }

    static func random() -> UIColor {
        UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
    
}

