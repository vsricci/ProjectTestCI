//
//  WeatherListViewModelTests.swift
//  GoodWeatherTests
//
//  Created by Vinicius Ricci on 05/02/19.
//  Copyright © 2019 Vinicius Ricci. All rights reserved.
//

import XCTest
@testable import GoodWeather

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel : WeatherListViewModel?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
//        self.weatherListViewModel = WeatherListViewModel()
//        self.weatherListViewModel?.addWeatherViewModel(vm: WeatherViewModel(name: Dynamic<String>("Houston"), main: Weather(temperature: Dynamic<Double>(32), temperatureMin: Dynamic<Double>(0), temperatureMax: Dynamic<Double>(0))))
//        
//        self.weatherListViewModel?.addWeatherViewModel(vm: WeatherViewModel(name: Dynamic<String>("Austin"), main: Weather(temperature: Dynamic<Double>(72), temperatureMin: Dynamic<Double>(0), temperatureMax: Dynamic<Double>(0))))
//        
        
    }

//    func test_should_be_able_to_celsius_successfully() {
//        let celsiusTemperature = [0, 22.2222]
//        self.weatherListViewModel?.updateUnit(to: .celsius)
//        for (index, vm) in (self.weatherListViewModel?.weatherViewModels.enumerated())! {
//            XCTAssertEqual(round(vm.main?.temperature?.value ?? 0.0), round(celsiusTemperature[index]))
//        }
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
