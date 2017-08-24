//
//  ColorExtensions.swift
//  TestKeyboard
//
//  Created by Nick Melnick on 8/24/17.
//  Copyright © 2017 Nick Melnick. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func fromColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
    
}

extension UIColor {
    
    class var BlackColor: UIColor {
        return colorFromHex("#3E546A")
    }
    class var BlueColor: UIColor {
        return colorFromHex("#00ABF8")
    }
    class var RedColor: UIColor {
        return colorFromHex("#FE5070")
    }
    class var YellowColor: UIColor {
        return colorFromHex("#FFA700")
    }
    class var GrayColor: UIColor {
        return colorFromHex("#8B99A7")
    }
    class var LightGrayColor: UIColor {
        return colorFromHex("#BAC5CF")
    }
    class var GreenColor:UIColor {
        return colorFromHex("#00E870") 
    }
}

