//
//  ButtonDecoration.swift
//  TestKeyboard
//
//  Created by Nick Melnick on 8/24/17.
//  Copyright © 2017 Nick Melnick. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureAsRigthButton(withTitle title:String) {
        clearSubviewsAndAnimation()
        configureAsBlueButton()
        contentHorizontalAlignment = .left
        setTitle(title, for: UIControlState())
        let image = UIImage(named: "arrow next")
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        tintColor = UIColor.LightGrayColor.withAlphaComponent(0.8)
        setImage(image?.withRenderingMode(.alwaysTemplate), for: .disabled)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        transform = CGAffineTransform(scaleX: -1.0, y: 1)
        titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1)
        imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1)
        tag = -2
    }
    
    func configureAsNextButton() {
        configureAsRigthButton(withTitle: "Next")
    }
    
    func configureAsSimpleButton(withTitle btnTitle:String) {
        clearSubviewsAndAnimation()
        configureAsBlueButton()
        contentHorizontalAlignment = .center
        setTitle(btnTitle, for: UIControlState())
    }
    
    private func clearSubviewsAndAnimation() {
        subviews.filter { $0.tag == -1 }.forEach{ $0.removeFromSuperview() }
        imageView?.stopAnimating()
        imageView?.animationImages = nil
        transform = CGAffineTransform(scaleX: 1.0, y: 1)
        titleLabel?.transform = CGAffineTransform(scaleX: 1.0, y: 1)
        imageView?.transform = CGAffineTransform(scaleX: 1.0, y: 1)
        setImage(nil, for: UIControlState())
        isUserInteractionEnabled = true
    }
    
    private func configureAsBlueButton() {
        clipsToBounds = true
        contentHorizontalAlignment = .center
        contentEdgeInsets = UIEdgeInsets.zero
        titleEdgeInsets = UIEdgeInsets.zero
        imageEdgeInsets = UIEdgeInsets.zero
        imageView?.contentMode = .scaleAspectFit
        setTitleColor(UIColor.white, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.9), for: .highlighted)
        setTitleColor(UIColor.LightGrayColor, for: .disabled)
        setBackgroundImage(UIImage.fromColor(UIColor.BlueColor), for: UIControlState())
        setBackgroundImage(UIImage.fromColor(UIColor.colorFromHex("#E3E6E9")), for: .disabled)
    }

}
