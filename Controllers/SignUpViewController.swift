//
//  SignUpViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit
import RxSwift

class SignUpViewController: UIViewController, SignUpView {
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var confirmad: Bool = false
    
    var onSignUpComplete: (() -> Void)?
    
    var onRegisterTapped: (() -> Void)?
    
    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        //self.loginButton.rx.
    }
    
    
    @IBAction func signUpComplete(_ sender: UIButton) {
        self.onSignUpComplete?()
    }
    
    @IBAction func showRegisterView(_ sender: UIButton) {
        self.onRegisterTapped?()
    }
}


