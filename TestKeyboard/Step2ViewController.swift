//
//  Step2ViewController.swift
//  TestKeyboard
//
//  Created by Nick Melnick on 8/24/17.
//  Copyright © 2017 Nick Melnick. All rights reserved.
//

import UIKit

class Step2ViewController: UIViewController {

    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nextBtn: UIButton!
    @IBOutlet var bottomPadding: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.configureAsNextButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeForKeyboardEvents()
        passwordTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeForKeyboardEvents()
    }
    
    override func updateUIForKeyboardEvent(_ withKeyboardFrome: CGRect) {
        bottomPadding.constant = view.bounds.maxY - withKeyboardFrome.minY
    }
    
}
