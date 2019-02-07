//
//  SettingsViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Vinicius Ricci on 05/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import XCTest
@testable import GoodWeather

class SettingsViewModelTests: XCTestCase {
    
    private var settingsViewModel : SettingsViewModel?
    
    override func setUp() {
        super.setUp()
        self.settingsViewModel = SettingsViewModel()
    }
    
    func test_should_return_correct_display_name_for_fahrenheit(){
        XCTAssertEqual(self.settingsViewModel?.selectedUnit.displayName, "fahrenheit")
    }

    func test_should_make_sure_that_defailt_selected_unit_is_fahrenheit() {
        XCTAssertEqual(settingsViewModel?.selectedUnit, .fahrenheit)
    }

    func test_should_be_able_to_save_unit_selection(){
        self.settingsViewModel?.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}

