//
//  CoordinatorProtocol.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation


protocol CoordinatorProtocol: AnyObject, NSObjectProtocol {
    
    
    var parent: CoordinatorProtocol? { get set }
    var identifier: String { get }
    func start()
    func stop()
    var childCoordinators : [String: CoordinatorProtocol] { get }
}

extension CoordinatorProtocol {
    var identifier : String {
        return "\(String(describing: type(of: self)))- \(self.hash))"
    }
    
}
