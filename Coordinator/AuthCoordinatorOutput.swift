//
//  AuthCoordinatorOutput.swift
//  GoodWeather
//
//  Created by Vinicius Ricci on 09/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import Foundation

protocol AuthCoordinatorOutput {
    var isFinished: (() -> ) {get set}
}
