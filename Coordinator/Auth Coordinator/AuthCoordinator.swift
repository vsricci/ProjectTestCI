//
//  AuthCoordinator.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 11/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

class AuthCoordinator : Coordinator, AuthCoordinatorOutput {
    var isFinished: (() -> Void)?
    
    
    private weak var register: RegisterView?
    private let authModuleFactory: AuthModuleFactory
    private let router: Router
    
    init(router: Router, authModuleFactory: AuthModuleFactory) {
        self.authModuleFactory = authModuleFactory
        self.router = router
    }
    
    override func start() {
        
        showSignUp()
        
    }
    
    
    func showSignUp() {
        let signUpOutput = authModuleFactory.makeSignUp()
        signUpOutput.onSignUpComplete = { [weak self] in
            self?.isFinished?()
        }
        signUpOutput.onRegisterTapped = { [] in
            self.showRegister()
        }
        router.setRootModule(signUpOutput)
    }
    
    func showRegister() {
        register = authModuleFactory.makeRegister()
        register?.onRegisterComplete = { [weak self] in
            self?.isFinished?()
        }
        register?.popUpSuccess = { [weak self] viewController in
           // self?.isFinished?()
            self?.router.present(viewController, animated: true)
        }
        
        self.router.push(self.register)
    }
}
