//
//  AuthModuleFactory.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol AuthModuleFactory {
    func makeSignUp() -> SignUpView
    func makeRegister() -> RegisterView
    
}
