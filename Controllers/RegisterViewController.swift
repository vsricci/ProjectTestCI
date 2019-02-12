//
//  RegisterViewController.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, RegisterView {
    var popUpSuccess: ((UIViewController) -> Void)?

    var onRegisterComplete: (() -> Void)?
    var regiterViewModel = RegisterViewModel()
    
    @IBOutlet weak var nameTextField: BindingTextField?{
        didSet {
            nameTextField?.bind { self.regiterViewModel.profile?.name = $0 }
        }
    }
    @IBOutlet weak var emailTextField: BindingTextField?{
        didSet {
            emailTextField?.bind { self.regiterViewModel.profile?.email = $0 }
        }
    }
    @IBOutlet weak var birthdayTextField: BindingTextField? {
        didSet {
            birthdayTextField?.bind { self.regiterViewModel.profile?.birthday = $0 }
        }
    }
    @IBOutlet weak var passwordTextField: BindingTextField? {
        didSet {
            passwordTextField?.bind { self.regiterViewModel.profile?.password = $0 }
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
       savaRegister()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func savaRegister() {
        guard let name = self.nameTextField?.text, let email = self.emailTextField?.text, let birthday = self.birthdayTextField?.text, let password = self.passwordTextField?.text else { return }
        
        if name != "" && email != "" && birthday != "" && password != "" {
            
            let infoProfile = UserDefaults.standard
            infoProfile.set(name, forKey: "name")
            infoProfile.set(email, forKey: "email")
            infoProfile.set(birthday, forKey: "birthday")
            infoProfile.set(password, forKey: "password")
            
            
            let alertVC = UIAlertController(title: "teste", message: "teste", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "ok", style: .default, handler: { alert in
                self.onRegisterComplete?()
            }))
            self.popUpSuccess?(alertVC)
        }
        else {
            print("No data saved")
        }
    }
}
