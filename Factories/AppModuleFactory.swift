//
//  AppModuleFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class AppModuleFactory : AuthModuleFactory{
    func makeSignUp() -> SignUpView {
        return SignUpViewController.controllerFromStoryboard(.auth)
    }
    
    func makeRegister() -> RegisterView {
        return RegisterViewController.controllerFromStoryboard(.auth)
    }
    
}