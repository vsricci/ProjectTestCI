//
//  CoordinatorProtocol.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 06/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation


protocol CoordinatorProtocol: AnyObject, NSObjectProtocol {
    func start()
    //func stop()
   // func startChild(_ coordinator : @escaping (CoordinatorProtocol?) -> ())
   // func stopChild(_ coordinator : @escaping (CoordinatorProtocol?) -> ())
}

extension CoordinatorProtocol {
    var identifier : String {
        return "\(String(describing: type(of: self)))- \(self.hash))"
    }
    
}
