//
//  UIView+Extensions.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 09/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import UIKit

extension UIView {
    
    private class func viewInNibNamed<T: UIView>(_ nibNamed: String) -> T {
        return Bundle.main.loadNibNamed(nibNamed, owner: nil, options: nil)!.first as! T
    }
    
    class func nib() -> Self {
        return viewInNibNamed(nameOfClass)
    }
    
    class func nib(_ frame: CGRect) -> Self {
        let view = nib()
        view.frame = frame
        view.layoutIfNeeded()
        return view
    }
}
