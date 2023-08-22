//
//  UIColorExtensions.swift
//  Vocapic
//
//  Created by ericzero on 8/20/23.
//

import Foundation
import UIKit

//extension UIColor {
//    static let transparent = hex("000000", alpha: 0)
//    static let popup_background = hex("000000", alpha: 0.03)
//    static let image_layer = hex("000000", alpha: 0.3)
//
//    static let dalring = rgb(97,79,132)
//    static let hint = rgb(173,172,172)
//    static let border = rgb(173,172,172)
//    static let disable = rgb(173,172,172)
//    static let varvara = rgb(3,2,2)
//    static let kevin = rgb()
//    )
//
//}

extension UIColor {
    static func hex(_ hex: String, alpha: CGFloat = 1.0) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    static func rgb(_ red: Int, _ green: Int, _ blue: Int, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }

    // Define your colors here
    static let transparent = hex("000000", alpha: 0)
    static let popup_background = hex("000000", alpha: 0.03)
    static let image_layer = hex("000000", alpha: 0.3)
    
    static let dalring = rgb(97, 79, 132)
    static let hint = rgb(173, 172, 172)
    static let border = rgb(173, 172, 172)
    static let disable = rgb(173, 172, 172)
    static let varvara = rgb(3, 2, 2)
    static let kevin = rgb(0, 0, 0) // You need to provide RGB values here
}
