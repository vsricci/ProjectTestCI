//
//  SignUpViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, SignUpView {
    var confirmad: Bool = false
    
    var onSignUpComplete: (() -> Void)?
    
    var onRegisterTapped: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func signUpComplete(_ sender: UIButton) {
        self.onSignUpComplete?()
    }
    
    @IBAction func showRegisterView(_ sender: UIButton) {
        self.onRegisterTapped?()
    }
}


