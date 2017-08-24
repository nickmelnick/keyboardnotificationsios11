//
//  KeyboardSubscription.swift
//  TestKeyboard
//
//  Created by Nick Melnick on 8/24/17.
//  Copyright © 2017 Nick Melnick. All rights reserved.
//

import UIKit

@objc protocol UIKeyboardBehavior {
    func subscribeForKeyboardEvents()
    func unsubscribeForKeyboardEvents()
    @objc func keyboardWillShowHideNotification(_ notification:Notification)
    @objc func updateUIForKeyboardEvent(_ withKeyboardFrame: CGRect)
}

extension UIViewController: UIKeyboardBehavior {

    func subscribeForKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowHideNotification(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeForKeyboardEvents() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShowHideNotification(_ notification:Notification) {
        let userInfo = notification.userInfo!
        
        let animationDuration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        let keyboardEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let convertedKeyboardEndFrame = view.convert(keyboardEndFrame, from: view.window)
        let rawAnimationCurve = (notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).uint32Value << 16
        let animationCurve = UIViewAnimationOptions(rawValue: UInt(rawAnimationCurve))
        updateUIForKeyboardEvent(convertedKeyboardEndFrame)
        UIView.animate(withDuration: animationDuration,
                       delay: 0.0,
                       options: [.beginFromCurrentState,animationCurve],
                       animations: {
                        self.view.layoutIfNeeded()
        },
                       completion:nil)
    }

    func updateUIForKeyboardEvent(_ withKeyboardFrame: CGRect) {
        
    }
    
}
