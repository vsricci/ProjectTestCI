//
//  SignUpView.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation


protocol SignUpView: BaseView {
    var confirmad: Bool { get set }
    var onSignUpComplete: (() -> Void)? { get set }
    var onRegisterTapped: (() -> Void)? { get set }
}
