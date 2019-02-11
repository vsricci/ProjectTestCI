//
//  NSObject+Extensiona.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 09/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
