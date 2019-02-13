//
//  RegisterViewModel.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 12/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol RegisterViewModelProtocol {
    var profile: Profile? { get set }
    var profileDidChange: ((RegisterViewModelProtocol) -> Void)? { get set }
}

class RegisterViewModel {
    var profile: Profile? = Profile()
}

class Profile: Decodable {
    
    var name: String?
    var email : String?
    var birthday: String?
    var password: String?
    
    convenience init(name: String?, email: String?, bithday: String?, password: String?) {
        self.init()
        self.name = name
        self.email = email
        self.birthday = bithday
        self.password = password
        
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case email
        case birthday
        case password
    }
    
     convenience required init(from decoder: Decoder) throws {
        
        let contaiter = try! decoder.container(keyedBy: CodingKeys.self)
        let name = try (contaiter.decode(String.self, forKey: .name))
        let email = try (contaiter.decode(String.self, forKey: .email))
        let birthday = try (contaiter.decode(String.self, forKey: .birthday))
        let password = try (contaiter.decode(String.self, forKey: .password))
        self.init(name: name, email: email, bithday: birthday, password: password)
    }
    
}
